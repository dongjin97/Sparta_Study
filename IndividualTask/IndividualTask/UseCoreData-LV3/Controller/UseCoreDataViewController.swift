//
//  USeCoreDataViewController.swift
//  IndividualTask
//
//  Created by 원동진 on 1/29/24.
//

import UIKit
import CoreData

class UseCoreDataViewController: UIViewController {
//MARK: - Data
    var taskList : [Task] = []
//MARK: -  View
    private lazy var taskCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10 // 열 수직 방향
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TaskCollectionViewCell.self, forCellWithReuseIdentifier: TaskCollectionViewCell.identi)
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = true
        return collectionView
    }()
    private lazy var addTaskButton : UIButton = {
        let button = UIButton()
        let imgConfig = UIImage.SymbolConfiguration(pointSize: 50, weight: .light)
        button.setImage(UIImage(systemName: "plus.circle.fill",withConfiguration: imgConfig), for: .normal)
        button.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubViews()
        setAutoLayout()
        collectionViewConfigure()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchTask()
    }
}
//MARK: - CollectionView 설정
extension UseCoreDataViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        taskList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskCollectionViewCell.identi, for: indexPath) as? TaskCollectionViewCell else { return UICollectionViewCell()}
        cell.setTaskCell(model: taskList[indexPath.item])
        cell.tapSwitchClosure = { [unowned self] isOn in
            self.updateTask(isOn: isOn, indexPath: indexPath)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        deleteTask(indexPath: indexPath)
    }
}
extension UseCoreDataViewController{
//MARK: - CoreDATA CRUD
    private func fetchTask(){
        self.taskList = CoreDataManger.shared.fetchTasksData()
        taskCollectionView.reloadData()
    }
    private func updateTask(isOn : Bool,indexPath: IndexPath){
        CoreDataManger.shared.updateTaskData(taskList: self.taskList, indexPath: indexPath, isOn: isOn)
        fetchTask()
    }
    private func deleteTask(indexPath : IndexPath){
        let alert = UIAlertController(title: "삭제", message: "해당 Task를 삭제하시곘습니까 ?", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "삭제", style: .default) {  _ in
            CoreDataManger.shared.deleteTaskData(taskList: self.taskList, indexPath: indexPath)
            self.fetchTask()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        self.present(alert, animated: true)
    }
}
//MARK: - View 관련 코드
extension UseCoreDataViewController{
    private func collectionViewConfigure(){
        taskCollectionView.delegate = self
        taskCollectionView.dataSource = self
    }
    private func addSubViews(){
        self.view.addSubViews([taskCollectionView,addTaskButton])
    }
    private func setAutoLayout(){
        taskCollectionView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        addTaskButton.snp.makeConstraints { make in
            make.bottom.right.equalTo(self.view.safeAreaLayoutGuide).offset(-50)
        }
        
    }
    // +버튼 추가 action
    @objc private func addTask(){
        let alert = UIAlertController(title: "추가", message: "추가할 내용을 입력하세요.", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "등록", style: .default) {  _ in
            guard let title = alert.textFields?[0].text else {return} // 할일 텍스트 필드 Text
            CoreDataManger.shared.addTaskData(title) // CoreData Create
            self.fetchTask()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        alert.addTextField {  title in // 할일 입력 place Holder
            title.placeholder = "할일을 입력하세요."
        }
        self.present(alert, animated: true)
    }
}

