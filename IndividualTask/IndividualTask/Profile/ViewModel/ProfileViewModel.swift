//
//  ProfileViewModel.swift
//  IndividualTask
//
//  Created by 원동진 on 2/1/24.
//

import Foundation
protocol ProfileViewModelDelegate : AnyObject{
    func updateUserName(name:String)
    func updateUserAge(age:Int)
}
class ProfileViewModel{
    private var user : ProfileModel
    weak var delegate : ProfileViewModelDelegate?
    init(user: ProfileModel) {
        self.user = user
    }
    lazy var userName : String = user.name{
        didSet{
            delegate?.updateUserName(name: userName)
        }
    }
    lazy var userAge : Int = user.age{
        didSet{
            delegate?.updateUserAge(age: userAge)
        }
    }
}
