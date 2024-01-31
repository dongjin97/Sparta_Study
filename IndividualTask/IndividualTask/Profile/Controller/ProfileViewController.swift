//
//  ProfileViewController.swift
//  IndividualTask
//
//  Created by 원동진 on 1/29/24.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK: - View
    private lazy var profileView : ProfileView = ProfileView()
    //MARK: - Data 객체
    var user : ProfileModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configureUI()
        user = ProfileModel(name: "동진", age: 28)
        setLabelData()
    }
    

}
extension ProfileViewController{
    private func configureUI(){
        self.view.addSubview(profileView)
        profileView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
        }
    }
    private func setLabelData(){
        self.profileView.setNameLabel(user?.name ?? "이름")
        self.profileView.setAgeLabel(user?.age ?? 0)
    }
}
