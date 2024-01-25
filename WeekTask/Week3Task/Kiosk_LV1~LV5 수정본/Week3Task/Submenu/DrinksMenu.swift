//
//  DrinksMenu.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/08.
//

import Foundation
let shackMadeLemonade = Drinks(menuNumber: 1, name: "Shack-made Lemonade", price: 3.9, explains: "매장에서 직접 만드는 상큼한 레몬에이드 (오리지날/시즈널)")
let freshBrewedIcedTea = Drinks(menuNumber: 2, name: "Fresh Brewed Iced Tea", price: 3.4, explains: "직접 유기농 홍차를 우려낸 아이스티")
let fifty = Drinks(menuNumber: 3, name: "Fifty/Fifty ", price: 3.5, explains: "레몬에이드와 아이스티의 만남")
let fountainSoda = Drinks(menuNumber: 4, name: "Fountain Soda", price: 2.7, explains: "코카콜라, 코카콜라 제로, 스프라이트, 환타오렌지, 환타 그레이프")
let abitaRootBeer = Drinks(menuNumber: 5, name: "Abita Root Beer", price: 4.4, explains: "청량감 있는 독특한 미국식 무알콜 탄산음료")
let bottledWater = Drinks(menuNumber: 6, name: "Bottled Water", price: 1.0, explains: "지리산 암반대수층으로 만든 프리미엄 생수")
let drinkList : [Drinks] = [shackMadeLemonade,freshBrewedIcedTea,fifty,fountainSoda,abitaRootBeer,bottledWater]
struct DrinksMenu {
    func run()->Drinks?{
        displaySubMenu(menu: drinkList)
        while true {
            var selectedProduct : Drinks?
            guard let input = Util.readInput() else {
                print("잘못 입력하셨습니다. 다시 입력해주세요\n")
                continue
            }
            switch input{
            case 1:
                selectedProduct = shackMadeLemonade
            case 2:
                selectedProduct = freshBrewedIcedTea
            case 3:
                selectedProduct = fifty
            case 4:
                selectedProduct = fountainSoda
            case 5:
                selectedProduct = abitaRootBeer
            case 6:
                selectedProduct = bottledWater
            case 0:
                return  nil
            default:
                print("잘못 입력하셨습니다. 다시 입력해주세요\n")
                continue
            }
            guard let selectedProduct else {return nil }
            
            print(selectedProduct.displayInfo())
            return selectedProduct
        }
    }
    func displaySubMenu(menu : [Product]){
        print("[ Drinks MENU ]")
        for product in menu{
            product.displayInfo()
        }
        print("0. 뒤로가기      | 뒤로가기")
    }
}
