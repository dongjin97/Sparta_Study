//
//  MiddelBarView.swift
//  IndividualTask
//
//  Created by 원동진 on 1/25/24.
//

import Foundation
import UIKit
#Preview{
    MiddelBarView()
}
class MiddelBarView : UIView {
    private lazy var buttonStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var followButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("Follow", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: OpenSans.bold, size: 20)!]))
        config.baseForegroundColor = .white
        config.titleAlignment = .center
        let button = UIButton(configuration: config)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.backgroundColor = .systemBlue
        return button
    }()
    private lazy var messageButton : UIButton = {
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("Message", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: OpenSans.bold, size: 20)!]))
        config.baseForegroundColor = .black
        config.titleAlignment = .center
        let button = UIButton(configuration: config)
        button.layer.borderWidth = 1.5
        button.layer.borderColor =  UIColor(hexCode: "DADADA").cgColor
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        return button
    }()
    private lazy var moreButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "moreImg"), for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor =  UIColor(hexCode: "DADADA").cgColor
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews([buttonStackView,moreButton])
        buttonStackView.addStackSubViews([followButton,messageButton])
        buttonStackView.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
        }
        moreButton.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.left.equalTo(buttonStackView.snp.right).offset(8)
            make.height.width.equalTo(30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
