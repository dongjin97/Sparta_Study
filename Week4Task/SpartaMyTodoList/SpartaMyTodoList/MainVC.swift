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
    var inputText : String = ""
    private lazy var todoLitsTableView : UITableView = {
        let tableView = UITableView(frame: .zero,style: .grouped)
        tableView.register(TodoListTVC.self, forCellReuseIdentifier: TodoListTVC.identi)
        return tableView
    }()
    private lazy var addTodoListBtn : UIButton = {
        let button = UIButton()
        let imgConfig = UIImage.SymbolConfiguration(pointSize: 50, weight: .light)
        button.setImage(UIImage(systemName: "plus.circle.fill",withConfiguration: imgConfig), for: .normal)
        button.addTarget(self, action: #selector(tapAddTodoList), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        addSubViews()
        setAutoLayout()
    }

}
extension MainVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoListTVC.identi, for: indexPath) as? TodoListTVC else{ return UITableViewCell()}
        cell.setTodoList(testData[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            testData.remove(at: indexPath.row)
            todoLitsTableView.reloadData()
        }
    }
    
}
extension MainVC{
    private func setTableView(){
        todoLitsTableView.dataSource = self
        todoLitsTableView.delegate = self
    }
    private func addSubViews(){
        view.addSubview(todoLitsTableView)
        view.addSubview(addTodoListBtn)
    }
    private func setAutoLayout(){
        addTodoListBtn.snp.makeConstraints { make in
            make.right.equalTo(self.view.snp.right).offset(-30)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-30)
        }
        todoLitsTableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
    }
    @objc func tapAddTodoList(){
        let alert = UIAlertController(title: "추가할 일을 입력하세요", message: nil, preferredStyle: .alert)
        let addAction = UIAlertAction(title: "등록", style: .default) {  _ in
            guard let title = alert.textFields?[0].text else {return}
            testData.append(TodoList(title: title, isCompleted: false))
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

