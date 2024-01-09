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
    private lazy var pushTodoListVCBtn : UIButton = { // 할일목록 push 버튼
        let btn = UIButton()
        btn.setTitle("할일 확인하기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(named: "PrimaryColor")
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(tapTodoListVC), for: .touchUpInside)
        return btn
    }()
    private lazy var completedTodoListVCBtn : UIButton = { // 완료된 할일 목록 push 버튼
        let btn = UIButton()
        btn.setTitle("완료한일 보기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(named: "PrimaryColor")
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(tapTodoListCompletedVC), for: .touchUpInside)
        return btn
    }()
    private lazy var pushPetVCBtn : UIButton = { // PetVC 로 Push 버튼
       let btn = UIButton()
        btn.setTitle("🐈", for: .normal)
        btn.addTarget(self, action: #selector(tapPushPetVC), for: .touchUpInside)
        return btn
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
        self.view.addSubview(pushTodoListVCBtn)
        self.view.addSubview(completedTodoListVCBtn)
        self.view.addSubview(pushPetVCBtn)
    }
    private func setAutoLayout(){
        spartaImgView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(50)
            make.left.equalTo(self.view.safeAreaLayoutGuide).offset(100)
            make.right.equalTo(self.view.safeAreaLayoutGuide).offset(-100)
        }
        pushTodoListVCBtn.snp.makeConstraints { make in
            make.top.equalTo(spartaImgView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
        completedTodoListVCBtn.snp.makeConstraints { make in
            make.top.equalTo(pushTodoListVCBtn.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
        pushPetVCBtn.snp.makeConstraints { make in
            make.top.equalTo(completedTodoListVCBtn.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-150)
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
}
