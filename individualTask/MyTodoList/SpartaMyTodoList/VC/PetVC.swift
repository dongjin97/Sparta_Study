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
    private lazy var refreshBtn : UIButton = { // 새로고침 버튼
        let btn = UIButton()
        btn.setTitle("", for: .normal)
        btn.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        btn.tintColor = .black
        btn.backgroundColor = .lightGray
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(tapRefreshAction), for: .touchUpInside)
        return btn
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
        self.view.addSubview(imgView)
        self.view.addSubview(refreshBtn)
    }
    private func setAutoLayout(){ // 오토레이 아웃 설정
        imgView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(300)
        }
        refreshBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(50)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
    }
    
    private func getCatData(){ // 데이터 불러 오는 함수
        CatDataManager.shared.getCatData { catData in
            let catData = catData[0]
            DispatchQueue.main.async {
                self.imgView.image = UIImage(systemName: "photo")
            }
            if let url = URL(string: catData.url){
                DispatchQueue.global().async { [weak self] in
                    if let data = try? Data(contentsOf: url) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self?.imgView.image = image
                                self?.imgView.snp.updateConstraints { make in
                                    make.height.equalTo(catData.height)
                                    make.width.equalTo(catData.width)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    @objc private func tapRefreshAction(){ // 새로고침 버튼
        getCatData()
    }
}
