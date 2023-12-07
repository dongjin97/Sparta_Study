//
//  Order.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/07.
//

import Foundation
class Order{
    let name : String
    let price : Double
    let explains : String
    init(name: String, price: Double, explains: String) {
        self.name = name
        self.price = price
        self.explains = explains
    }
    func diplayBasketInfo(){
        print("\n\(name) | W \(price) | \(explains)")
       
    }
    func orderDisplay(){
        let str = """
        ---------------------------------------------------
        "SHAKESHACK BURGER 에 오신걸 환영합니다."
        아래 메뉴판을 보시고 메뉴를 골라 입력해주세요.
        
        [ SHAKESHACK MENU ]
        1. Burgers         | 앵거스 비프 통살을 다져만든 버거
        2. Forzen Custard  | 매장에서 신선하게 만드는 아이스크림
        3. Drinks          | 매장에서 직접 만드는 음료
        4. Beer            | 뉴욕 브루클린 브루어리에서 양조한 맥주
        
        [ ORDER MENU ]
        5. Order       | 장바구니를 확인 후 주문합니다.
        6. Cancel      | 진행중인 주문을 취소합니다.
        """
        print(str)
    }
    func orderResult(totalPrice : Double){
        print("\n[ Total ]\n")
        print("W \(totalPrice)\n")
        print("1. 주문      2. 메뉴판")
        let completeOrder = Int(readLine()!)
        if completeOrder == 1{
            let remainMoney = myAccount - totalPrice
            if remainMoney < 0 {
                print("현재 잔액\(myAccount)W 으로 \(String(format: "%.1f", abs(remainMoney)))W 이 부족해서 주문할 수 없습니다.")
            }else{
                print("구매를 완료했습니다. 현재 잔액은 \(String(format: "%.1f", abs(remainMoney))) W입니다")
            }
        }
    }
}
