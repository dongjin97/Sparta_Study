//
//  File.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/04.
//

import Foundation
class ShackShackMenu{
    let mainMenuNum : Int
    let mainMenuName : String
    let mainMenuInfo : String

    init(mainMenuNum: Int, mainMenuName: String, mainMenuInfo: String) {
        self.mainMenuNum = mainMenuNum
        self.mainMenuName = mainMenuName
        self.mainMenuInfo = mainMenuInfo
    }

    func displayInfo(){
        print("\(mainMenuNum). \(mainMenuName) | \(mainMenuInfo)")
    }
    func displayMenu(){
        print("\n[ \(mainMenuName) MENU ]")   
    }
    func backMenu(){
        print("0. 뒤로가기      | 뒤로가기")
    }
}
