//
//  FrozenCustarMenu.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/08.
//

import Foundation
struct FrozenCustarMenu {
    func run()->FrozenCustar?{
        displaySubMenu(menu: bugerList)
        while true {
            var selectedProduct : FrozenCustar?
            guard let input = Util.readInput() else {
                print("잘못 입력하셨습니다. 다시 입력해주세요\n")
                continue
            }
            switch input{
            case 1:
                selectedProduct = shake
            case 2:
                selectedProduct = shakOfTheWeek
            case 3:
                selectedProduct = redBeanShake
            case 4:
                selectedProduct = floats
            case 5:
                selectedProduct = cupsCones
            case 6:
                selectedProduct = concretes
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
        print("[ FrozenCustar MENU ]")
        for product in menu{
            product.displayInfo()
        }
        print("0. 뒤로가기      | 뒤로가기")
    }
}
