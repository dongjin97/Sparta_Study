//
//  main.swift
//  Week3TaskLV5
//
//  Created by 원동진 on 2023/12/07.
//

import Foundation
//MARK: - d
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

func displayOrder(){
    let str = """
    아래와 같이 주문 하시겠습니까 ?
    [ Orders ]
    ShackBurger   | W 6.9 | 토마토, 양상추, 쉑소스가 토핑된 치즈버거

    [ Total ]
    W 6.9
    1. 주문      2. 메뉴판
    """
    print(str)
}
func updateOrderPeople(){
    orderPeople+=1
    print("현재 주문 대기수:\(orderPeople)")
}
while status != 1{
    DispatchQueue.global().async {
        while true {
            sleep(10)
            updateOrderPeople()
        }
    }
    print("주문 내역을 불러오는중입니다 !! 3초만 기다려주세요")
    DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
        displayOrder()
    }

    let input = Int(readLine()!)
    if input == 1{
        let hourStandard = hour > 12 ? "오후 \(hour % 12) " : "오전\(hour%12)"
        print("현재 시각은 \(hourStandard)시 \(min)분입니다.")
        if hour == 19 && 30 < min  && 40 > min{
            print("은행 점검시간은 오후 7시 30분 ~ 오후 7시 40분이므로 결제할 수 없습니다.")
        }else{
            print("결제를 완료했습니다. (\(String(describing: dateString)))")
            status = 1
        }
    }
    
}

