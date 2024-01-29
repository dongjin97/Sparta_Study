//
//  ProfileDesignVC.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2024/01/25.
//

import UIKit

class ProfileDesignVC: UIViewController {
    var imageList = [UIImage(named: "picture-1"),UIImage(named: "picture-2"),UIImage(named: "picture-3"),UIImage(named: "picture-4"),UIImage(named: "picture-5"),UIImage(named: "picture-6"),UIImage(named: "picture-7")]
    private lazy var dismissButton : UIButton = {
        let button = UIButton()
        button.setTitle("main", for: .normal)
        button.titleLabel?.font = UIFont(name: OpenSans.bold, size: 18)
        button.addTarget(self, action: #selector(tapDismissMain), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    private lazy var userNameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "nabaecamp"
        label.font = UIFont(name: OpenSans.bold, size: 18)
        return label
    }()
    private lazy var settingButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Menu"), for: .normal)
        return button
    }()
    private lazy var userInfoView : UserInfoView = {
        let view = UserInfoView()
        view.setCntLabel(model: UserInfo(post: 7, follower: 0, following: 0))
        return view
    }()
    private lazy var middleBarView : MiddelBarView = {
        let view = MiddelBarView()
        return view
    }()
    private lazy var middleBarViewBorder : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexCode: "DBDBDB")
        return view
    }()
    private lazy var navigalleryButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Grid"), for: .normal)
        return button
    }()
    private lazy var navigalleryButtonBorder : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var pictureCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2 // 행 수평방향
        layout.minimumLineSpacing = 2 // 열 수직 방향
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PictureCollectionViewCell.self, forCellWithReuseIdentifier: PictureCollectionViewCell.identi)
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = true
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubViewS()
        setAutoLayout()
        collectionViewConfigure()
        
    }
}
//MARK: - CollectionView
extension ProfileDesignVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCollectionViewCell.identi, for: indexPath)as? PictureCollectionViewCell else {return UICollectionViewCell()}
        cell.setPictureImage(model: imageList[indexPath.item]!)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (pictureCollectionView.frame.width / 3) - 2, height: pictureCollectionView.frame.height / 3)
    }
}
//MARK: -  Button Action
extension ProfileDesignVC {
    @objc private func tapDismissMain(){
        self.dismiss(animated: true)
    }
}
//MARK: - View/UI관련
extension ProfileDesignVC{
    private func collectionViewConfigure(){
        pictureCollectionView.delegate = self
        pictureCollectionView.dataSource = self
    }
    private func addSubViewS(){
        self.view.addSubViews([dismissButton,userNameLabel,settingButton,userInfoView,middleBarView,middleBarViewBorder,navigalleryButton,navigalleryButtonBorder,pictureCollectionView])
    }
    private func setAutoLayout(){
        dismissButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            make.left.equalToSuperview().offset(15)
        }
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.centerX.equalToSuperview()
        }
        settingButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        userInfoView.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(14)
            make.right.equalToSuperview().offset(-28)
            //            make.bottom.equalToSuperview()
        }
        middleBarView.snp.makeConstraints { make in
            make.top.equalTo(userInfoView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        middleBarViewBorder.snp.makeConstraints { make in
            make.top.equalTo(middleBarView.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        navigalleryButton.snp.makeConstraints { make in
            make.top.equalTo(middleBarViewBorder.snp.bottom).offset(10)
            make.left.equalToSuperview()
            make.width.equalToSuperview().dividedBy(3)
        }
        navigalleryButtonBorder.snp.makeConstraints { make in
            make.top.equalTo(navigalleryButton.snp.bottom).offset(10)
            make.left.equalToSuperview()
            make.width.equalTo(navigalleryButton)
            make.height.equalTo(1)
        }
        pictureCollectionView.snp.makeConstraints { make in
            make.top.equalTo(navigalleryButtonBorder.snp.bottom).offset(1)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}

