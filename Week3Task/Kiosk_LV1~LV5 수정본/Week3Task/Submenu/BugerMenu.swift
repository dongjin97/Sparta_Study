//
//  BugerMenu.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/08.
//

import Foundation
let shackBurger = Buger(menuNumber:1,name: "ShackBurger", price: 6.9, explains: "토마토, 양상추, 쉑소스가 토핑된 치즈버거")
let smokeShack = Buger(menuNumber:2,name: "SmokeShack", price: 8.9, explains: "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거")
let shroomBurger = Buger(menuNumber: 3, name: "Shroom Burger", price: 9.4, explains: "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거")
let cheeseburger = Buger(menuNumber: 4, name: "Cheeseburger", price: 6.9, explains: "포테이토 번과 비프패티, 치즈가 토핑된 치즈버거")
let hamburger = Buger(menuNumber: 5, name: "Hamburger", price: 5.4, explains: "비프패티를 기반으로 야채가 들어간 기본버거")
let bugerList : [Buger] = [shackBurger,smokeShack,shroomBurger,cheeseburger,hamburger]
struct BugerMenu {
    func run()->Buger?{
        displaySubMenu(menu: bugerList)
        while true {
            var selectedProduct : Buger?
            guard let input = Util.readInput() else {
                print("잘못 입력하셨습니다. 다시 입력해주세요\n")
                continue
            }
            switch input{
            case 1:
                selectedProduct = shackBurger
            case 2:
                selectedProduct = smokeShack
            case 3:
                selectedProduct = shroomBurger
            case 4:
                selectedProduct = cheeseburger
            case 5:
                selectedProduct = hamburger
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
        print("[ Burgers MENU ]")
        for product in menu{
            product.displayInfo()
        }
        print("0. 뒤로가기      | 뒤로가기")
    }
}
