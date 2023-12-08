//
//  Order.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/08.
//

import Foundation
var orderPeople = 0
var status = 0
var formatter = Date()
let dateComponent = Calendar.current.dateComponents([.hour, .minute], from: formatter)
let hour = dateComponent.hour!
let min = dateComponent.minute!

var dateString: String {
    let date =  Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return formatter.string(from: date)
}
struct Order{
    
    func run(accountPrice : Double,total : Double) -> Bool{
        let remainMoney = accountPrice - total
        while true{
            guard let input = Util.readInput() else {
                print("잘못 입력하셨습니다. 다시 입력해주세요\n")
                continue
            }
            switch input {
            case 1:
                let hourStandard = hour > 12 ? "오후 \(hour % 12) " : "오전\(hour%12)"
                print("현재 시각은 \(hourStandard)시 \(min)분입니다.")
                if hour == 19 && 30 < min  && 40 > min{
                    print("은행 점검시간은 오후 7시 30분 ~ 오후 7시 40분이므로 결제할 수 없습니다.")
                    return false
                }
                if remainMoney < 0 {
                    print("현재 잔액\(accountPrice)W 으로 \(String(format: "%.1f", abs(remainMoney)))W 이 부족해서 주문할 수 없습니다.\n")
                    return false
                }else{
                    print("구매를 완료했습니다. 현재 잔액은 \(String(format: "%.1f", abs(remainMoney))) W입니다\n")
                    return true
                }
            case 2:
                return false
            default:
                print("잘못 입력하셨습니다. 다시 입력해주세요")
                continue
            }
        }
        
      
        
    
    }
}
