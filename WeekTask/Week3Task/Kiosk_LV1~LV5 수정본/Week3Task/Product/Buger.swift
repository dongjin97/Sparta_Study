//
//  Buger.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/04.
//

import Foundation

class Buger : Product{
    override func displayInfo(){
        if name.count < 17 {
            name = name.padding(toLength: 17, withPad: " ", startingAt: 0)
        }
        print("\(menuNumber). \(name) | W \(price) | \(explains)")
    }
}
