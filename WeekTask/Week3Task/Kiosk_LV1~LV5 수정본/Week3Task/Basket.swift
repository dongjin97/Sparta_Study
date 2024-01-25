//
//  Basket.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/08.
//

import Foundation
class Basket{
    private var basketList : [Product] = []
    private func displayCheck(){
        print("""
            위 메뉴를 장바구니에 추가하시겠습니까?
            1. 확인        2. 취소
            """)
    }
    func checkProduct(_ selctedProduct : Product){
        displayCheck()
        while true{
            guard let input = Util.readInput() else{
                print("잘못 입력하셨습니다. 다시 입력해주세요\n")
                continue
            }
            switch input{
            case 1:
                print("\(selctedProduct.name)가 장바구니에 추가 되었습니다.\n")
                basketList.append(selctedProduct)
            case 2:
                print("취소 되었습니다.\n")
            default:
                print("잘못 입력하셨습니다. 다시 입력해주세요\n")
            }
            return
        }
    }
    public var isEmpty : Bool{
        basketList.isEmpty
    }
    func removeAll(){
        basketList.removeAll()
    }
    func displayBasket(){
        for product in basketList{
            product.displayInfo()
        }
    }
    func displayTotal()->Double{
        var sum = 0.0
        for basket in basketList{
            sum += basket.price
        }
        print("[ Total ]")
        print("W \(sum)\n")
      return sum
    }
}
