//
//  TodoListCompletedVC.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2024/01/09.
//

import UIKit

class TodoListCompletedVC: UIViewController {
    var todoListCompletedArr = [TodoListCompleted]() // 완료된 TodoList 배열
    private lazy var todoListLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.text = "완료한 ToDolist"
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    private lazy var todoLitsTableView : UITableView = {
        let tableView = UITableView(frame: .zero,style: .plain)
        tableView.register(TodoListCompletedTVC.self, forCellReuseIdentifier: TodoListCompletedTVC.identi)
        tableView.register(TodoListHeader.self, forHeaderFooterViewReuseIdentifier: TodoListHeader.identi) // 카테고리만 출력함으로 똑같이 재사용
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        loadToDoList()
        setTableView()
        addSubViews()
        setAutoLayout()
    }

}

extension TodoListCompletedVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListCompletedArr[section].list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoListCompletedTVC.identi, for: indexPath) as? TodoListCompletedTVC else{ return UITableViewCell()}
        cell.setTodoList(model: todoListCompletedArr[indexPath.section].list[indexPath.row])
        return cell
    }
//MARK: - Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TodoListHeader.identi) as? TodoListHeader else {return UIView()}
        headerView.setCategoty(model: todoListCompletedArr[section].category) // 카테고리 설정
        return headerView
    }
    func numberOfSections(in tableView: UITableView) -> Int { // 섹션 개수
        return todoListCompletedArr.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: .random())
     }
}
extension TodoListCompletedVC{
    //MARK: - View관련 함수
    private func setTableView(){ // TalbeView Configure
        todoLitsTableView.dataSource = self
        todoLitsTableView.delegate = self
    }
    private func addSubViews(){ // UI 추가함수
        view.addSubview(todoListLabel)
        view.addSubview(todoLitsTableView)
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
    }
    //MARK: - Data 관련 함수
    private func loadToDoList(){ // 데이터 읽어오기
        let data = TodoListManager.shared.loadTodoList()
        for todoList in data{  // 완료한 TodoList만 배열로 만들기 위한 로직
            let category = todoList.category
            var completedList = [TodoListContentComplted]()
            for list in todoList.list{
                if list.isCompleted {
                    completedList.append(TodoListContentComplted(title: list.title, date: list.date))
                }else{
                    continue
                }
            }
            todoListCompletedArr.append(TodoListCompleted(category: category, list: completedList))
        }
    }
}
