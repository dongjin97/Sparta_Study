//
//  main.swift
//  Week2Task
//
//  Created by 원동진 on 2023/11/28.
//
import Foundation
//MARK: - LV1
/*
 class Calculator {
     func calculate(_ oper: String ,firstNumber: Double, secondNumber: Double) -> Double {
         switch oper{
         case "+":
             return firstNumber + secondNumber
         case "-":
             return firstNumber - secondNumber
         case "/":
             return firstNumber / secondNumber
         case "*":
             return firstNumber * secondNumber
         default:
             return 0
         }
       }
 }
 let calculator = Calculator()
 let addResult =  calculator.calculate("+", firstNumber: 5, secondNumber: 5)
 print("addResult : \(addResult)")
 let subtractResult = calculator.calculate("-", firstNumber: 10, secondNumber: 5)
 print("subtractResult : \(subtractResult)")
 let multiplyResult = calculator.calculate("*", firstNumber: 5, secondNumber: 3)
 print("multiplyResult : \(multiplyResult)")
 let divideResult = calculator.calculate("/", firstNumber: 15, secondNumber: 2)
 print("divideResult : \(divideResult)")

 */
//MARK: - LV2
/*
class Calculator {
    func calculate(_ oper: String ,firstNumber: Double, secondNumber: Double) -> Double {
        switch oper{
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "/":
            return firstNumber / secondNumber
        case "*":
            return firstNumber * secondNumber
        case "%":
            return firstNumber.truncatingRemainder(dividingBy: secondNumber)
        default:
            return 0
        }
      }
}
let calculator = Calculator()
let addResult =  calculator.calculate("+", firstNumber: 5, secondNumber: 5)
print("addResult : \(addResult)")
let subtractResult = calculator.calculate("-", firstNumber: 10, secondNumber: 5)
print("subtractResult : \(subtractResult)")
let multiplyResult = calculator.calculate("*", firstNumber: 5, secondNumber: 3)
print("multiplyResult : \(multiplyResult)")
let divideResult = calculator.calculate("/", firstNumber: 15, secondNumber: 2)
print("divideResult : \(divideResult)")
let remainderResult = calculator.calculate("%", firstNumber: 15, secondNumber: 2)
print("remainderResult : \(remainderResult)")
*/

//MARK: - LV3
//class Calculator {
//    let addResult : AddOperation
//    let subtractResult : SubstractOperation
//    let multiplyResult : MultiplyOperation
//    let divideResult : DivideOperation
//    init(addResult: AddOperation,subtractResult : SubstractOperation,multiplyResult : MultiplyOperation,divideResult : DivideOperation){
//        self.addResult = addResult
//        self.subtractResult = subtractResult
//        self.multiplyResult = multiplyResult
//        self.divideResult = divideResult
//    }
//    func calculate(_ oper: String ,firstNumber: Double, secondNumber: Double) -> Double {
//        switch oper{
//        case "+":
//            return addResult.operate(firstNumber, secondNumber)
//        case "-":
//            return subtractResult.operate(firstNumber, secondNumber)
//        case "*":
//            return multiplyResult.operate(firstNumber, secondNumber)
//        case "/":
//            return divideResult.operate(firstNumber, secondNumber)
//        default:
//            return 0
//        }
//    }
//}
//class AddOperation{
//    func operate(_ firstNumber : Double ,_ secondNumber: Double) -> Double {
//        return firstNumber + secondNumber
//    }
//}
//class SubstractOperation{
//    func operate(_ firstNumber : Double ,_ secondNumber: Double) -> Double {
//        return firstNumber - secondNumber
//    }
//}
//class MultiplyOperation{
//    func operate(_ firstNumber : Double ,_ secondNumber: Double) -> Double {
//        return firstNumber * secondNumber
//    }
//}
//class DivideOperation{
//    func operate(_ firstNumber : Double ,_ secondNumber: Double) -> Double {
//        return firstNumber / secondNumber
//    }
//}
//let calculator = Calculator(addResult: AddOperation(), subtractResult: SubstractOperation(), multiplyResult: MultiplyOperation(), divideResult: DivideOperation())
//let addResult =  calculator.calculate("+", firstNumber: 5, secondNumber: 15)
//let subtractResult = calculator.calculate("-", firstNumber: 10, secondNumber: 5)
//let multiplyResult = calculator.calculate("*", firstNumber: 5, secondNumber: 3)
//let divideResult = calculator.calculate("/", firstNumber: 15, secondNumber: 2)
//
//print("addResult : \(addResult)")
//print("subtractResult : \(subtractResult)")
//print("multiplyResult : \(multiplyResult)")
//print("divideResult : \(divideResult)")

// 여기서는 책임은 : 연산을 의미
// 하나의 클래스에 여러개의 책임을 가지고 있는것이 아닌 하나의 책임만을 가지도록 하여 내부의 다른 곳에 영향을끼치지 않게 한다.
// 연산에 더 추가하여 확장하는 것이 간편하다.

//MARK: - LV4
import Foundation

protocol AbstractOperation{
    func operate(_ firstNumber : Double ,_ secondNumber: Double) -> Double
}
class Calculator {
    var abstractOperation : AbstractOperation
    init(abstractOperation: AbstractOperation) {
        self.abstractOperation = abstractOperation
    }
    func changeProperty(oper: AbstractOperation){
        self.abstractOperation = oper
    }
    func calculate(firstNumber: Double ,secondNumber: Double) -> Double {
        return abstractOperation.operate(firstNumber, secondNumber)
    }
}
class AddOperation : AbstractOperation{
    func operate(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        return firstNumber + secondNumber
    }
}
class SubstractOperation : AbstractOperation{
    func operate(_ firstNumber : Double ,_ secondNumber: Double) -> Double {
        return firstNumber - secondNumber
    }
}
class MultiplyOperation : AbstractOperation{
    func operate(_ firstNumber : Double ,_ secondNumber: Double) -> Double {
        return firstNumber * secondNumber
    }
}
class DivideOperation : AbstractOperation{
    func operate(_ firstNumber : Double ,_ secondNumber: Double) -> Double {
        return firstNumber / secondNumber
    }
}
let calculator = Calculator(abstractOperation: AddOperation())
let addResult = calculator.calculate(firstNumber: 5, secondNumber: 5)
calculator.changeProperty(oper: SubstractOperation())
let subtractResult = calculator.calculate(firstNumber: 10, secondNumber: 5)
calculator.changeProperty(oper: MultiplyOperation())
let multiplyResult = calculator.calculate(firstNumber: 5, secondNumber: 5)
calculator.changeProperty(oper: DivideOperation())
let divideResult = calculator.calculate(firstNumber: 10, secondNumber: 5)

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
