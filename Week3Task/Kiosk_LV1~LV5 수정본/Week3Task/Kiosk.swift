//
//  Kiosk.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/08.
//

import Foundation
class Kisok{
  
    let basket = Basket()
    let order = Order()
    let account = Account()
    var orderCnt = 0
    func run(){
        while true {
            DispatchQueue.global().async {
                while true {
                    sleep(10) // 너무 빨리 찍히는거 같아서 10 초로 설정했습니다.
                    self.updateOrderPeople()
                }
            }
            let subMenuNum = ShackShackMenu.run(basket.isEmpty)
           nextStep(selectedSubMenu: subMenuNum)
        }
    }
    private func nextStep(selectedSubMenu : ShackShackMenu.Item){
        var selectedSubMenuDetail : Product?
 
        switch selectedSubMenu{
        case .burgers:
            selectedSubMenuDetail = BugerMenu().run()
        case .frozenCustard:
            selectedSubMenuDetail = FrozenCustarMenu().run()
        case .drinks:
            selectedSubMenuDetail = DrinksMenu().run()
        case .beer:
            selectedSubMenuDetail = BeerMenu().run()
        case .order:
            orderMenu()
        
        }
        
        if let selectedSubMenuDetail{
            basket.checkProduct(selectedSubMenuDetail)
        }
    }
    private func orderMenu(){
        var total = 0.0
        print("주문 내역을 불러오는중입니다 !! 3초만 기다려주세요")
        DispatchQueue.global().asyncAfter(deadline: .now() + 5) { // 주문내역 딜레이 걸었습니다.
            print("아래와 같이 주문하시겠습니까?\n[ Orders ]")
            self.basket.displayBasket()
            total = self.basket.displayTotal()
            print("1. 주문      2. 메뉴판")
        }
        
        
        let orderSuccess = order.run(accountPrice: account.myAccount, total:total)
        if orderSuccess{
            account.consume(total)
            basket.removeAll()
            orderCnt+=1
        }
    }
    func updateOrderPeople(){
  
        print("현재 주문 대기수:\(orderCnt)")
    }
}
