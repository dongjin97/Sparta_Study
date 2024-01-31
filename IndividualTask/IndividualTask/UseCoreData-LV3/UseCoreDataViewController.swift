//
//  USeCoreDataViewController.swift
//  IndividualTask
//
//  Created by 원동진 on 1/29/24.
//

import UIKit
import CoreData

class UseCoreDataViewController: UIViewController {
    var taskList : [Task] = []
    var persistentContainer: NSPersistentContainer? {
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    }
    
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
        button.addTarget(self, action: #selector(addTaskList), for: .touchUpInside)
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
        fetchTaskData()
    }
}
extension UseCoreDataViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        taskList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskCollectionViewCell.identi, for: indexPath) as? TaskCollectionViewCell else { return UICollectionViewCell()}
        cell.setTaskCell(model: taskList[indexPath.item])
        cell.tapSwitchClosure = { [unowned self] isOn in
            self.updateTaskData(isOn: isOn, indexPath: indexPath)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        deleteTaskData(indexPath: indexPath)
    }
}
extension UseCoreDataViewController{
    // +버튼 추가 action
    @objc private func addTaskList(){
        let alert = UIAlertController(title: "추가", message: "추가할 내용을 입력하세요.", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "등록", style: .default) {  _ in
            guard let title = alert.textFields?[0].text else {return} // 할일 텍스트 필드 Text
            CoreDataManger.shared.addTaskData(title)
            self.fetchTaskData()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        alert.addTextField {  title in // 할일 입력 place Holder
            title.placeholder = "할일을 입력하세요."
        }
        self.present(alert, animated: true)
    }
    private func fetchTaskData(){
        self.taskList = CoreDataManger.shared.fetchTasksData()
        taskCollectionView.reloadData()
    }
    private func updateTaskData(isOn : Bool,indexPath: IndexPath){
        CoreDataManger.shared.updateTaskData(taskList: self.taskList, indexPath: indexPath, isOn: isOn)
        fetchTaskData()
    }
    private func deleteTaskData(indexPath : IndexPath){
        let alert = UIAlertController(title: "삭제", message: "해당 Task를 삭제하시곘습니까 ?", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "삭제", style: .default) {  _ in
            CoreDataManger.shared.deleteTaks(taskList: self.taskList, indexPath: indexPath)
            self.fetchTaskData()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(cancelAction)
        alert.addAction(addAction)
        self.present(alert, animated: true)
    }
}
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
}

