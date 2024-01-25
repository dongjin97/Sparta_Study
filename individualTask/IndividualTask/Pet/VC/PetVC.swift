//
//  PetVC.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2024/01/09.
//

import UIKit
import SnapKit
class PetVC: UIViewController {
    var heigth = 0
    var width = 0
    private lazy var imgView : UIImageView = { // 고양이 이미지
        let imgView = UIImageView()
        return imgView
    }()
    private lazy var refreshButton : UIButton = { // 새로고침 버튼
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(tapRefreshAction), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        getCatData()
        addSubView()
        setAutoLayout()
        
    }
}
extension PetVC{
    private func addSubView(){ // UI 추가
        self.view.addSubViews([imgView,refreshButton])
    }
    private func setAutoLayout(){ // 오토레이 아웃 설정
        imgView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(300)
        }
        refreshButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(50)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
    }
    
    private func getCatData(){ // 데이터 불러 오는 함수
        CatDataManager.shared.getCatData { catData in
            switch catData {
            case .success(let data):
                guard let imgAPI = data.first else {return}

                DispatchQueue.main.async {
                    self.imgView.image = UIImage(systemName: "photo")
                }
                DispatchQueue.main.async {
                    if CGFloat(imgAPI.width) > UIScreen.main.bounds.width {
                        let ratio = UIScreen.main.bounds.width / CGFloat(imgAPI.width)
                        let width = CGFloat(imgAPI.width) * ratio
                        let height = CGFloat(imgAPI.height) * width / CGFloat(imgAPI.width)
                        self.imgView.snp.updateConstraints { make in
                            make.height.equalTo(height)
                            make.width.equalTo(width)
                        }
                    }else{
                        self.imgView.snp.updateConstraints { make in
                            make.height.equalTo(imgAPI.height)
                            make.width.equalTo(imgAPI.width)
                        }
                    }
                    if let url = URL(string: imgAPI.url){
                        self.imgView.load(url: url)
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.title = error.localizedDescription
                    self.imgView.image = UIImage(systemName: "x.circle")
                }   
            }
        }
    }
    @objc private func tapRefreshAction(){ // 새로고침 버튼
        getCatData()
    }
}
