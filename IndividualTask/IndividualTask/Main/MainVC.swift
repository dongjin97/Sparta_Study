//
//  MainVC.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2024/01/09.
//

import UIKit
import SnapKit
class MainVC: UIViewController {
    
    private lazy var spartaImgView : UIImageView = { // 스파르타 이미지
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    private lazy var buttonStackView : UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    private lazy var pushTodoListVCbutton : UIButton = { // 할일목록 push 버튼
        let button = UIButton()
        button.setTitle("할일 확인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "PrimaryColor")
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapTodoListVC), for: .touchUpInside)
        return button
    }()
    private lazy var completedTodoListVCbutton : UIButton = { // 완료된 할일 목록 push 버튼
        let button = UIButton()
        button.setTitle("완료한일 보기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "PrimaryColor")
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapTodoListCompletedVC), for: .touchUpInside)
        return button
    }()
    private lazy var pushPetVCbutton : UIButton = { // PetVC 로 Push 버튼
       let button = UIButton()
        button.setTitle("🐈", for: .normal)
        button.addTarget(self, action: #selector(tapPushPetVC), for: .touchUpInside)
        return button
    }()
    private lazy var profileDesignVCButton : UIButton = { // PetVC 로 Push 버튼
       let button = UIButton()
        button.setTitle("ProfileDesignViewController", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "PrimaryColor")
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapPresentProfileDesignVC), for: .touchUpInside)
        return button
    }()
    private lazy var profileButton : UIButton = { // PetVC 로 Push 버튼
       let button = UIButton()
        button.setTitle("ProfileViewController", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "PrimaryColor")
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tabPushProfileVC), for: .touchUpInside)
        return button
    }()
    private lazy var userCoreDataButton : UIButton = { // PetVC 로 Push 버튼
       let button = UIButton()
        button.setTitle("LV3UserCoreData", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "PrimaryColor")
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tabPushLV3UseCoreData), for: .touchUpInside)
        return button
    }()
    private lazy var randomVideoViewControllerButton : UIButton = { // PetVC 로 Push 버튼
       let button = UIButton()
        button.setTitle("RandomVideoViewController", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "PrimaryColor")
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapRandomVideoViewController), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubViews()
        setAutoLayout()
        getHomeImg()
    }
}
extension MainVC{
//MARK: - View 관련함수
    private func addSubViews(){
        self.view.addSubview(spartaImgView)
        self.view.addSubview(buttonStackView)
        buttonStackView.addStackSubViews([pushTodoListVCbutton,completedTodoListVCbutton,pushPetVCbutton,profileDesignVCButton,profileButton,userCoreDataButton,randomVideoViewControllerButton])
    }
    private func setAutoLayout(){
        spartaImgView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(150)
            make.centerX.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(150)
        }
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(spartaImgView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-50)
        }
        
    }
    private func getHomeImg(){ // URL -> UIImage 함수
        if let url = URL(string: "https://spartacodingclub.kr/css/images/scc-og.jpg") {
            self.spartaImgView.load(url: url)
        }
    }
    
//MARK: - Button Action 함수
    @objc private func tapPushPetVC(){
        pushVC(PetVC())
    }
    @objc private func tapTodoListVC(){
        pushVC(TodoListVC())
    }
    @objc private func tapTodoListCompletedVC(){
        pushVC(TodoListCompletedVC())
    }
    @objc private func tapPresentProfileDesignVC(){
        let vc = ProfileDesignTabBarController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    @objc private func tabPushProfileVC(){
        let user = ProfileModel(name: "동진", age: 27)
        let viewModel = ProfileViewModel(user: user)
        pushVC(ProfileViewController(viewModel: viewModel))
    }
    @objc private func tabPushLV3UseCoreData(){
        pushVC(UseCoreDataViewController())
    }
    @objc private func tapRandomVideoViewController(){
        pushVC(RandomVideoViewController())
    }
}
