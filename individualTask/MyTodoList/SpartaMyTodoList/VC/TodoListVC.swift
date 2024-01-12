//
//  ViewController.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2023/12/11.
//

import UIKit
import Foundation
import SnapKit

class TodoListVC: UIViewController {
    var todoListArr = [TodoList](){
        didSet{
            self.saveToDoList() // ToList값 변경된 직후 해당 함수 호출로 데이터 저장
        }
    }
    //MARK: - 수정을 위한 변수
    var indexPathSection = 0 // 수정을 위한 Section 저장
    var indexPathRow = 0 // 수정을 위한 Row저장
    
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
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.saveToDoList() // View가 사라지기전 한번더 저장
    }
}
extension TodoListVC : UITableViewDelegate,UITableViewDataSource{
    //MARK: - CEll
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListArr[section].list.count // cell개수
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoListTVC.identi, for: indexPath) as? TodoListTVC else{ return UITableViewCell()}
        cell.setTodoList(todoListArr[indexPath.section].list[indexPath.row]) // Cell Data 설정
        cell.tapCheckBtnClosure = { [unowned self] selected in
            todoListArr[indexPath.section].list[indexPath.row].isCompleted = selected // checkBox 버튼 액션
            saveToDoList()
        }
        cell.tapUpdateBtnClosure = {[unowned self] in // 수정 버튼 액션
            self.indexPathSection = indexPath.section
            self.indexPathRow = indexPath.row
            updateTodoList()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{ // 스와이프해서 삭제 하는 기능
            todoListArr[indexPath.section].list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            if todoListArr[indexPath.section].list.isEmpty{ // 섹션에 할일 없을경우 해당 섹션도 삭제하기 위함
                todoListArr.remove(at: indexPath.section)
                tableView.deleteSections(IndexSet(arrayLiteral: indexPath.section), with: .fade)
            }
        }
    }
    //MARK: - Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TodoListHeader.identi) as? TodoListHeader else {return UIView()}
        headerView.setCategoty(model: todoListArr[section].category) // 카테고리 설정
        return headerView
    }
    func numberOfSections(in tableView: UITableView) -> Int { // 섹션 개수
        return todoListArr.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: .random())
    }
}
extension TodoListVC{
    //MARK: - View관련 함수
    private func setTableView(){ // TalbeView Configure
        todoLitsTableView.dataSource = self
        todoLitsTableView.delegate = self
    }
    private func addSubViews(){ // UI 추가함수
        view.addSubview(todoListLabel)
        view.addSubview(todoLitsTableView)
        view.addSubview(addTodoListBtn)
    }
    private func setAutoLayout(){ // 오토레이아웃 설정 함수
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
        TodoListManager.shared.saveTodoList(todoList: todoListArr)
    }
    private func loadToDoList(){ // 데이터 읽어오기
        self.todoListArr = TodoListManager.shared.loadTodoList()
    }
    //MARK: - 기능 관련 함수
    // 할일 추가 함수
    @objc func addTodoList(){
        let alert = UIAlertController(title: "추가", message: "추가할 내용을 입력하세요.", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "등록", style: .default) {  _ in
            guard let category = alert.textFields?[0].text else {return} // 카테고리 테스트 픽드 Text
            guard let title = alert.textFields?[1].text else {return} // 할일 텍스트 필드 Text
            let currentDate = Date()
            let data = TodoListContent(title: title, isCompleted: false, date: currentDate) // 할일로 구성 된 data
            if let index = self.todoListArr.firstIndex(where: {$0.category == category}){ // 할일에 대한 카테고리를 찾아서 해당 카테고리 있을경우
                self.todoListArr[index].list.append(data) // 카테고리 Section에 추가
            }else{
                self.todoListArr.append(TodoList(category: category, list: [data])) // 없을경우 새로운 카테고리 생성및 할일 추가
            }
            self.todoLitsTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        alert.addTextField {  category in // 카테고리 입력 place Holder
            category.placeholder = "카테고리를 입력하세요."
        }
        alert.addTextField {  title in // 할일 입력 place Holder
            title.placeholder = "할일을 입력하세요."
        }
        self.present(alert, animated: true)
    }
    //할일 수정 함수
    private func updateTodoList(){ // 수정할경우 카테고리는 수정 불가능 할일만 수정 가능 하게 구성
        let alert = UIAlertController(title: "수정", message: "내용을 입력하세요.", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "수정", style: .default) { [self]  _ in
            let currentDate = Date()
            guard let title = alert.textFields?[0].text else {return}  // 할일 텍스트 필드 Text
            let updateData = TodoListContent(title: title, isCompleted: self.todoListArr[indexPathSection].list[indexPathRow].isCompleted, date: currentDate)
            self.todoListArr[indexPathSection].list[indexPathRow] = updateData // 수정된 데이터 대입
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

