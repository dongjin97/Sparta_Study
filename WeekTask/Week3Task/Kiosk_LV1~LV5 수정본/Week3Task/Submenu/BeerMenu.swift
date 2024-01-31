//
//  BeerMenu.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/08.
//

import Foundation
let shackMeisterAle = Beer(menuNumber: 1, name: "ShackMeister Ale", price: 9.8, explains: "쉐이크식 버거를 위해 뉴욕 브루클린 브루어리에서 특별히 양조한 에일 맥주")
let magpieBrewing = Beer(menuNumber: 2, name: "Magpie Brewing Co.", price: 6.8, explains: "Pale Ale, Draft")
let beerList : [Beer] = [shackMeisterAle,magpieBrewing]

struct BeerMenu {
    func run()->Beer?{
        displaySubMenu(menu: beerList)
        while true {
            var selectedProduct : Beer?
            guard let input = Util.readInput() else {
                print("잘못 입력하셨습니다. 다시 입력해주세요\n")
                continue
            }
            switch input{
            case 1:
                selectedProduct = shackMeisterAle
            case 2:
                selectedProduct = magpieBrewing
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
        print("[ Beer MENU ]")
        for product in menu{
            product.displayInfo()
        }
        print("0. 뒤로가기      | 뒤로가기")
    }
}
