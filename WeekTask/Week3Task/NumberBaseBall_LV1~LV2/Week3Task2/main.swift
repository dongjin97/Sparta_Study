//
//  main.swift
//  Week3Task2
//
//  Created by 원동진 on 2023/12/07.
//

import Foundation

print("<게임을 시작합니다>")
var numSet = Set<Int>()
while numSet.count != 3 {
    numSet.insert(Int.random(in: 1...9))
}
//let numArr = [n1,n2,n3]
let numArr = [4,5,6]
var strike = 0
var ball = 0
while true{
    print("숫자를 입력하세요")
    let input = Array(readLine()!).map{Int(String($0)) ?? -1}
    
    if input.contains(-1){
        print("올바르지 않은 입력값입니다.")
    }else if input.contains(0){
        print("올바르지 않은 입력값입니다.")
    }else if !sameNum(input){
        print("올바르지 않은 입력값입니다.")
    }else{
        for i in 0..<input.count{
            if input[i] == numArr[i]{
                strike += 1
            }else if numArr.contains(input[i]){
                
                ball+=1
            }
        }
        if strike == 0 && ball == 0{
            print("Nothing")
        }else if strike == 3{
            print("정답입니다!")
            break
        }else if ball == 0{
            print("\(strike)스트라이크")
        }else if strike == 0{
            print("\(ball)볼")
        }else{
            print("\(strike)스트라이크 \(ball)볼")
        }
        strike = 0
        ball = 0
    }
    print("")
}

func sameNum(_ arr : [Int]) -> Bool{
    return Set(arr).count == arr.count
}
