//
//  Beer.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/04.
//

import Foundation
class Beer : Menu{
    override func displayInfo(){
        print("\(menuNumber). \(name) | W \(price) | \(explains)")
    }
    
}
