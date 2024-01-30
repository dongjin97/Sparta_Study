//
//  ProfileView.swift
//  IndividualTask
//
//  Created by 원동진 on 1/30/24.
//

import UIKit
import SnapKit
class ProfileView: UIView {
    private lazy var nameLabel = UILabel()
    private lazy var ageLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews([nameLabel,ageLabel])
        nameLabel.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
        }
        ageLabel.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.left.equalTo(nameLabel.snp.right).offset(30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func setNameLabel(_ name : String){
        nameLabel.text = name
    }
    public func setAgeLabel(_ age : Int){
        ageLabel.text = "\(age)"
    }
}

