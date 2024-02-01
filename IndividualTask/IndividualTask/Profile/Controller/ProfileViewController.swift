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
    private var viewModel : ProfileViewModel
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.viewModel.delegate = self
        configureUI()
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
        self.profileView.setNameLabel(viewModel.userName)
        self.profileView.setAgeLabel(viewModel.userAge)
//        updateUserName(name: viewModel.userName)
//        updateUserAge(age: viewModel.userAge)
        
    }
}
extension ProfileViewController : ProfileViewModelDelegate{
    func updateUserName(name: String) {
        DispatchQueue.main.async{
            self.profileView.setNameLabel(name)
        }
    }
    
    func updateUserAge(age: Int) {
        DispatchQueue.main.async{
            self.profileView.setAgeLabel(age)
        }
    }
}
