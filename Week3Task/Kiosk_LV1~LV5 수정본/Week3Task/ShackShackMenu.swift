//
//  File.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/04.
//

import Foundation
class ShackShackMenu{
    enum Item: Int {
        case burgers = 1
        case frozenCustard
        case drinks
        case beer
        case order
    }
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
    static func run(_ orderListIsEmpty : Bool)-> ShackShackMenu.Item{
        while true{
            displayMainMenu(orderListIsEmpty)
            guard let input = Util.readInput(),
                let selectedItem = Item(rawValue: input) else {
                print("잘못 입력하셨습니다. 다시 입력해주세요\n")
                continue
            }
            return selectedItem
        }
    }
    
    static func displayMainMenu(_ orderListIsEmpty : Bool){
        var mainMenuDisplay = """
        ------------------------------------
        "SHAKESHACK BURGER 에 오신걸 환영합니다."
        아래 메뉴판을 보시고 메뉴를 골라 입력해주세요.\n
        [ SHAKESHACK MENU ]
        1. Burgers         | 앵거스 비프 통살을 다져만든 버거
        2. Frozen Custard  | 매장에서 신선하게 만드는 아이스크림
        3. Drinks          | 매장에서 직접 만드는 음료
        4. Beer            | 뉴욕 브루클린 브루어리에서 양조한 맥주
        """
        if !orderListIsEmpty{
            mainMenuDisplay += """
                            \n
                            [ ORDER MENU ]
                            5. Order       | 장바구니를 확인 후 주문합니다.
                            6. Cancel      | 진행중인 주문을 취소합니다.
                            """
        }
        print(mainMenuDisplay)
    }
 

}
