//
//  FrozenCustarMenu.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/08.
//

import Foundation
let shake = FrozenCustar(menuNumber: 1, name: "Shake", price: 6.5, explains: "바닐라, 초콜렛, 솔티드 카라멜, 블랙 & 화이트,스토로 베리,피넛버터, 커피")
let shakOfTheWeek = FrozenCustar(menuNumber: 2, name: "Shake of the Week", price: 6.5, explains: "특별한 커스터드 플레이버")
let redBeanShake = FrozenCustar(menuNumber: 3, name: "Red Bean Shake", price: 6.5, explains: "신선한 커스터드와 함께 우유와 레드빈이 블렌딩 된 시즈널 쉐이크")
let floats = FrozenCustar(menuNumber: 4, name: "Floats", price: 4.9, explains: "루트비어, 퍼플 카우, 크림시클")
let cupsCones = FrozenCustar(menuNumber: 5, name: "Cups & Cones", price: 4.9, explains: "바닐라, 초콜렛, Flavor of the Week")
let concretes = FrozenCustar(menuNumber: 6, name: "Concretes", price: 5.9, explains: "쉐이크쉐의 쫀득한 커스터드와 다양한 믹스-인의 조합")
let frozenCustarList : [FrozenCustar] = [shake,shakOfTheWeek,redBeanShake,floats,cupsCones,concretes]
struct FrozenCustarMenu {
    func run()->FrozenCustar?{
        displaySubMenu(menu: frozenCustarList)
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
