//
//  ProfileDesignVC.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2024/01/25.
//

import UIKit

class ProfileDesignVC: UIViewController {
    private lazy var dismissButton : UIButton = {
        let button = UIButton()
        button.setTitle("main", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(tapDismissMain), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    private lazy var userNameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "nabaecamp"
        label.font = UIFont.boldSystemFont(ofSize: 18)
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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubViewS()
        setAutoLayout()
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
    private func addSubViewS(){
        self.view.addSubViews([dismissButton,userNameLabel,settingButton,userInfoView,middleBarView])
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
    }
}

