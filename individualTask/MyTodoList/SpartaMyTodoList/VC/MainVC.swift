//
//  ViewController.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2023/12/11.
//

import UIKit
import Foundation
import SnapKit

class MainVC: UIViewController {
    var todoListArr = [TodoList]()
    var toDoList = [TodoListContent](){
        didSet{
            self.saveToDoList()
        }
    }
    var indexPathRow = 0
    var indexPathSection = 0
    private lazy var todoListLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.text = "TodoList"
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    // TodoList TableView
    private lazy var todoLitsTableView : UITableView = {
        let tableView = UITableView(frame: .zero,style: .plain)
        tableView.register(TodoListTVC.self, forCellReuseIdentifier: TodoListTVC.identi)
        tableView.register(TodoListHeader.self, forHeaderFooterViewReuseIdentifier: TodoListHeader.identi)
        return tableView
    }()
    // TodoList 추가하기 버튼
    private lazy var addTodoListBtn : UIButton = {
        let button = UIButton()
        let imgConfig = UIImage.SymbolConfiguration(pointSize: 50, weight: .light)
        button.setImage(UIImage(systemName: "plus.circle.fill",withConfiguration: imgConfig), for: .normal)
        button.addTarget(self, action: #selector(addTodoList), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        loadToDoList()
        setTableView()
        addSubViews()
        setAutoLayout()
 
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.saveToDoList()
    }
}
extension MainVC : UITableViewDelegate,UITableViewDataSource{
    //MARK: - CEll
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListArr[section].list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoListTVC.identi, for: indexPath) as? TodoListTVC else{ return UITableViewCell()}
        cell.setTodoList(todoListArr[indexPath.section].list[indexPath.row])
        
        cell.tapCheckBtnClosure = { [unowned self] selected in
            todoListArr[indexPath.section].list[indexPath.row].isCompleted = selected
            toDoList[indexPath.row].isCompleted = selected
        }
        cell.tapUpdateBtnClosure = {[unowned self] in
            self.indexPathRow = indexPath.row
            self.indexPathSection = indexPath.section
            updateTodoList()
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: .random())
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            todoListArr[indexPath.section].list.remove(at: indexPath.row)
            toDoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            if todoListArr[indexPath.section].list.isEmpty{
                todoListArr.remove(at: indexPath.section)
                tableView.deleteSections(IndexSet(arrayLiteral: indexPath.section), with: .fade)
            }
        }
    }
    //MARK: - Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TodoListHeader.identi) as? TodoListHeader else {return UIView()}
        headerView.setCategoty(model: todoListArr[section].category)
        return headerView
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return todoListArr.count
    }
    
}
extension MainVC{
    //MARK: - View관련 함수
    private func setTableView(){
        todoLitsTableView.dataSource = self
        todoLitsTableView.delegate = self
    }
    private func addSubViews(){
        view.addSubview(todoListLabel)
        view.addSubview(todoLitsTableView)
        view.addSubview(addTodoListBtn)
    }
    private func setAutoLayout(){
        todoListLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        todoLitsTableView.snp.makeConstraints { make in
            make.top.equalTo(todoListLabel.snp.bottom).offset(10)
            make.bottom.left.right.equalTo(self.view.safeAreaLayoutGuide)
        }
        addTodoListBtn.snp.makeConstraints { make in
            make.right.equalTo(self.view.snp.right).offset(-30)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-30)
        }
        
        
    }
    //MARK: - Data 관련 함수
    private func saveToDoList(){ // Data 저장
        let data = self.toDoList.map{
            [
                "category" : $0.category,
                "title" : $0.title,
                "date" : $0.date,
                "isCompleted" : $0.isCompleted
            ] as [String : Any]
        }
        print(data)
        UserDefaults.standard.set(data, forKey: "todolistKey")
        UserDefaults.standard.synchronize() // 데이터를 쓰고나면 싱크 맞추기
    }
    private func loadToDoList(){ // 데이터 읽어오기
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "todolistKey") as? [[String: Any]] else { return }

        self.toDoList = data.compactMap {
            guard let category = $0["category"] as? String,
                  let title = $0["title"] as? String,
                  let date = $0["date"] as? Date,
                  let isCompleted = $0["isCompleted"] as? Bool else {
                return nil
            }
            return TodoListContent(category: category, title: title, isCompleted: isCompleted, date: date)
        }
        for todo in toDoList{
            
            if let index = todoListArr.firstIndex(where: {$0.category == todo.category}){
                todoListArr[index].list.append(todo)
            }else{
                todoListArr.append(TodoList(category: todo.category, list: [todo]))
            }
        }
    }
    //MARK: - 기능 관련 함수
    // 할일 추가 함수
    @objc func addTodoList(){
        let alert = UIAlertController(title: "추가", message: "추가할 내용을 입력하세요.", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "등록", style: .default) {  _ in
            guard let category = alert.textFields?[0].text else {return}
            guard let title = alert.textFields?[1].text else {return}
            let currentDate = Date()
            let data = TodoListContent(category:category,title: title, isCompleted: false,date: currentDate)
            self.toDoList.append(data)
            if let index = self.todoListArr.firstIndex(where: {$0.category == data.category}){
                self.todoListArr[index].list.append(data)
            }else{
                self.todoListArr.append(TodoList(category: data.category, list: [data]))
            }
            self.todoLitsTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        alert.addTextField {  category in
            category.placeholder = "카테고리를 입력하세요."
        }
        alert.addTextField {  title in
            title.placeholder = "할일을 입력하세요."
        }
        
        self.present(alert, animated: true)
        
    }
    // 할일 수정 함수
    private func updateTodoList(){
        print(self.indexPathSection)
        print(self.indexPathRow)
        
        let alert = UIAlertController(title: "수정", message: "내용을 입력하세요.", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "수정", style: .default) { [self]  _ in
            let currentDate = Date()
            guard let title = alert.textFields?[0].text else {return}
            let data = TodoListContent(category:toDoList[indexPathRow].category,title: title, isCompleted: self.toDoList[self.indexPathRow].isCompleted,date: currentDate)
            
            self.toDoList[indexPathRow] = data
            self.todoListArr[indexPathSection].list[indexPathRow] = data
            self.todoLitsTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        alert.addTextField {  textField in
            textField.placeholder = "할일을 입력하세요."
        }
        self.present(alert, animated: true)
        
    }
    
}

