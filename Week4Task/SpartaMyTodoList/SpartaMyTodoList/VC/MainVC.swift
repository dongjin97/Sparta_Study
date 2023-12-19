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
    // TodoList TitleLabel
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
        return tableView
    }()
    // TodoList 추가하기 버튼
    private lazy var addTodoListBtn : UIButton = {
        let button = UIButton()
        let imgConfig = UIImage.SymbolConfiguration(pointSize: 50, weight: .light)
        button.setImage(UIImage(systemName: "plus.circle.fill",withConfiguration: imgConfig), for: .normal)
        button.addTarget(self, action: #selector(tapAddTodoList), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setTableView()
        addSubViews()
        setAutoLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
}
extension MainVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoListTVC.identi, for: indexPath) as? TodoListTVC else{ return UITableViewCell()}
        cell.setTodoList(testData[indexPath.row])
        cell.tapPushBtnClosure = { [unowned self] in
            let pushVC = TodoListDetailVC()
            pushVC.detailTitle = testData[indexPath.row].title
            pushVC.idx = indexPath.row
            pushVC.setImage(image: testData[indexPath.row].img ?? UIImage(systemName: "plus.app.fill"))
            pushVC.setTextView(content: testData[indexPath.row].contents ?? pushVC.textViewPlaceHolder)
            self.navigationController?.pushViewController(pushVC, animated: true)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            testData.remove(at: indexPath.row)
            todoLitsTableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
}
extension MainVC{
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
    @objc func tapAddTodoList(){
        let alert = UIAlertController(title: "추가할 일을 입력하세요", message: nil, preferredStyle: .alert)
        let addAction = UIAlertAction(title: "등록", style: .default) {  _ in
            guard let title = alert.textFields?[0].text else {return}
            let currentDate = Date()
            testData.append(TodoList(title: title, isCompleted: false,date: currentDate))
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

