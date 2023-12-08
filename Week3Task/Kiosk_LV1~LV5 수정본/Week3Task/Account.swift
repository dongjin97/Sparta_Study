//
//  Account.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/08.
//

import Foundation
class Account{
    var myAccount = Double(Int.random(in: 10...50))
    func consume(_ totalPrice : Double){
        myAccount -= totalPrice
    }
}
