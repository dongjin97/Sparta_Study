//
//  BugerMenu.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/08.
//

import Foundation

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
