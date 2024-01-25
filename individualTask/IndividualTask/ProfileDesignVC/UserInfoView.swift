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
        addSubViews([userImageView,userFollowInfoView])
        userFollowInfoView.addSubViews([labelCntStackView,postLabel,followerLabel,followingLabel])
        labelCntStackView.addStackSubViews([postCntLabel,followerCntLabel,followingCntLabel])
    }
    private func setAutoLayout(){
        userImageView.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.height.width.equalTo(88)
        }
        userFollowInfoView.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
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
    }
}
