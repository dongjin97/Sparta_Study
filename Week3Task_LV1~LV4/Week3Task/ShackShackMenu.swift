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
    let mainMenuCnt : Int

    init(mainMenuNum: Int, mainMenuName: String, mainMenuInfo: String, mainMenuCnt: Int) {
        self.mainMenuNum = mainMenuNum
        self.mainMenuName = mainMenuName
        self.mainMenuInfo = mainMenuInfo
        self.mainMenuCnt = mainMenuCnt
    }

    func displayInfo(){
        print("\(mainMenuNum). \(mainMenuName) | \(mainMenuInfo)")
    }
    func welcomeText(){
        let str = """
        ---------------------------------------------------
        "SHAKESHACK BURGER 에 오신걸 환영합니다."
        아래 메뉴판을 보시고 메뉴를 골라 입력해주세요.\n
        [ SHAKESHACK MENU ]
        """
        print(str)
    }
    func displaySubMenu(menu : [Menu]){
        print("\n[ \(mainMenuName) MENU ]")
        for product in menu{
            product.displayInfo()
        }
        print("0. 뒤로가기      | 뒤로가기")
    }
}
