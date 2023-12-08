//
//  DrinksMenu.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/08.
//

import Foundation
struct DrinksMenu {
    func run()->Drinks?{
        displaySubMenu(menu: bugerList)
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
