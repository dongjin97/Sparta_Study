//
//  UserInfoView.swift
//  IndividualTask
//
//  Created by 원동진 on 1/25/24.
//

import Foundation
import UIKit
class UserInfoView : UIView {
    private lazy var userImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "UserPic")
        return imageView
    }()
    private lazy var userFollowInfoView : UIView = {
        let view = UIView()
        return view
    }()
    private lazy var labelCntStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 22
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var postCntLabel = UILabel()
    private lazy var followerCntLabel = UILabel()
    private lazy var followingCntLabel = UILabel()
    private lazy var postLabel = UILabel()
    private lazy var followerLabel = UILabel()
    private lazy var followingLabel = UILabel()
    private lazy var userIntroduceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 2
        label.textColor = .black
        label.setRangeTextFont(fullText: "르탄이\niOS Developer 🍎", range: "iOS Developer 🍎", uiFont: UIFont.systemFont(ofSize: 14))
        return label
    }()
    private lazy var urlButton : UIButton =  {
        var config = UIButton.Configuration.plain()
        config.title = "spartacodingclub.kr"
        config.baseForegroundColor = .systemBlue
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)
        let button = UIButton(configuration: config)
        button.contentHorizontalAlignment = .leading

        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setAutoLayout()
        setUILabel()
        setTextLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension UserInfoView{
    func setCntLabel(model : UserInfo){
        postCntLabel.text = "\(model.post)"
        followerCntLabel.text = "\(model.follower)"
        followingCntLabel.text = "\(model.following)"
    }
    private func setTextLabel(){
        postLabel.text = "post"
        followerLabel.text = "follower"
        followingLabel.text = "following"
    }
    private func setUILabel(){
        [postCntLabel,followerCntLabel,followingCntLabel].forEach { label in
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 17)
        }
        [postLabel,followerLabel,followingLabel].forEach { label in
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 14)
        }
    }
    private func addSubViews(){
        addSubViews([userImageView,userFollowInfoView,userIntroduceLabel,urlButton])
        userFollowInfoView.addSubViews([labelCntStackView,postLabel,followerLabel,followingLabel])
        labelCntStackView.addStackSubViews([postCntLabel,followerCntLabel,followingCntLabel])
    }
    private func setAutoLayout(){
        userImageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.height.width.equalTo(88)
        }
        userFollowInfoView.snp.makeConstraints { make in
            make.top.right.equalToSuperview()
            make.left.equalTo(userImageView.snp.right).offset(41)
        }
        labelCntStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        postLabel.snp.makeConstraints { make in
            make.top.equalTo(postCntLabel.snp.bottom)
            make.left.equalTo(postCntLabel.snp.left)
            make.right.equalTo(postCntLabel.snp.right)
            make.bottom.equalToSuperview()
        }
        followerLabel.snp.makeConstraints { make in
            make.top.equalTo(followerCntLabel.snp.bottom)
            make.left.equalTo(followerCntLabel.snp.left)
            make.right.equalTo(followerCntLabel.snp.right)
            make.bottom.equalToSuperview()
        }
        followingLabel.snp.makeConstraints { make in
            make.top.equalTo(followingCntLabel.snp.bottom)
            make.left.equalTo(followingCntLabel.snp.left)
            make.right.equalTo(followingCntLabel.snp.right)
            make.bottom.equalToSuperview()
        }
        userIntroduceLabel.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.bottom).offset(14)
            make.left.right.equalToSuperview()
        }
        urlButton.snp.makeConstraints { make in
            make.top.equalTo(userIntroduceLabel.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
