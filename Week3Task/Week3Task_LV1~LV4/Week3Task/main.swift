//
//  main.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/04.
//

import Foundation
//MARK: - Buger
let shackBurger = Buger(menuNumber:1,name: "ShackBurger", price: 6.9, explains: "토마토, 양상추, 쉑소스가 토핑된 치즈버거")
let smokeShack = Buger(menuNumber:2,name: "SmokeShack", price: 8.9, explains: "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거")
let shroomBurger = Buger(menuNumber: 3, name: "Shroom Burger", price: 9.4, explains: "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거")
let cheeseburger = Buger(menuNumber: 4, name: "Cheeseburger", price: 6.9, explains: "포테이토 번과 비프패티, 치즈가 토핑된 치즈버거")
let hamburger = Buger(menuNumber: 5, name: "Hamburger", price: 5.4, explains: "비프패티를 기반으로 야채가 들어간 기본버거")
//MARK: - FrozenCustar
let shake = FrozenCustar(menuNumber: 1, name: "Shake", price: 6.5, explains: "바닐라, 초콜렛, 솔티드 카라멜, 블랙 & 화이트,스토로 베리,피넛버터, 커피")
let shakOfTheWeek = FrozenCustar(menuNumber: 2, name: "Shake of the Week", price: 6.5, explains: "특별한 커스터드 플레이버")
let redBeanShake = FrozenCustar(menuNumber: 3, name: "Red Bean Shake", price: 6.5, explains: "신선한 커스터드와 함께 우유와 레드빈이 블렌딩 된 시즈널 쉐이크")
let floats = FrozenCustar(menuNumber: 4, name: "Floats", price: 4.9, explains: "루트비어, 퍼플 카우, 크림시클")
let cupsCones = FrozenCustar(menuNumber: 5, name: "Cups & Cones", price: 4.9, explains: "바닐라, 초콜렛, Flavor of the Week")
let concretes = FrozenCustar(menuNumber: 6, name: "Concretes", price: 5.9, explains: "쉐이크쉐의 쫀득한 커스터드와 다양한 믹스-인의 조합")
//MARK: - Drink
let shackMadeLemonade = Drinks(menuNumber: 1, name: "Shack-made Lemonade", price: 3.9, explains: "매장에서 직접 만드는 상큼한 레몬에이드 (오리지날/시즈널)")
let freshBrewedIcedTea = Drinks(menuNumber: 2, name: "Fresh Brewed Iced Tea", price: 3.4, explains: "직접 유기농 홍차를 우려낸 아이스티")
let fifty = Drinks(menuNumber: 3, name: "Fifty/Fifty ", price: 3.5, explains: "레몬에이드와 아이스티의 만남")
let fountainSoda = Drinks(menuNumber: 4, name: "Fountain Soda", price: 2.7, explains: "코카콜라, 코카콜라 제로, 스프라이트, 환타오렌지, 환타 그레이프")
let abitaRootBeer = Drinks(menuNumber: 5, name: "Abita Root Beer", price: 4.4, explains: "청량감 있는 독특한 미국식 무알콜 탄산음료")
let bottledWater = Drinks(menuNumber: 6, name: "Bottled Water", price: 1.0, explains: "지리산 암반대수층으로 만든 프리미엄 생수")
//MARK: - Beer
let shackMeisterAle = Beer(menuNumber: 1, name: "ShackMeister Ale", price: 9.8, explains: "쉐이크식 버거를 위해 뉴욕 브루클린 브루어리에서 특별히 양조한 에일 맥주")
let magpieBrewing = Beer(menuNumber: 2, name: "Magpie Brewing Co.", price: 6.8, explains: "Pale Ale, Draft")

let bugerList : [Buger] = [shackBurger,smokeShack,shroomBurger,cheeseburger,hamburger]
let frozenCustarList : [FrozenCustar] = [shake,shakOfTheWeek,redBeanShake,floats,cupsCones,concretes]
let drinkList : [Drinks] = [shackMadeLemonade,freshBrewedIcedTea,fifty,fountainSoda,abitaRootBeer,bottledWater]
let beerList : [Beer] = [shackMeisterAle,magpieBrewing]


//MARK: - MENU
let burgersMenu = ShackShackMenu(mainMenuNum: 1, mainMenuName: "Burgers", mainMenuInfo: "앵거스 비프 통살을 다져만든 버거", mainMenuCnt: bugerList.count)
let frozenCustardMenu = ShackShackMenu(mainMenuNum: 2, mainMenuName: "Frozen CustardMenu", mainMenuInfo: "매장에서 신선하게 만드는 아이스크림", mainMenuCnt: frozenCustarList.count)
let drinksMenu = ShackShackMenu(mainMenuNum: 3, mainMenuName: "Drinks", mainMenuInfo: "매장에서 직접 만드는 음료", mainMenuCnt: drinkList.count)
let beerMenu = ShackShackMenu(mainMenuNum: 4, mainMenuName: "Beer", mainMenuInfo: "뉴욕 브루클린 브루어리에서 양조한 맥주", mainMenuCnt: beerList.count)
let exit = ShackShackMenu(mainMenuNum: 0, mainMenuName: "종료", mainMenuInfo: "프로그램 종료", mainMenuCnt: -1)

let menuList : [ShackShackMenu] = [burgersMenu,frozenCustardMenu,drinksMenu,beerMenu,exit]
//MARK: - Order
var orderList : [Order] = []
var menuStep = 0
var menuNumber = 0
var myAccount = 5.5
fristExplainMenu()
while true {
    if !orderList.isEmpty{ // 장바구니에 목록이 생겼을경우
        orderList.last!.orderDisplay() // 마지막 장바구니 제품을 통해 Display
        var orderTotal = 0.0
        let input = Int(readLine()!) // 장바구니에 목록이 생겼을경우의 input
        switch input{
        case 0:
            fristExplainMenu()
            menuStep = 0
        case 1:
            burgersMenu.displaySubMenu(menu: bugerList)
            menuStep = 1
            menuNumber = 0
        case 2:
            burgersMenu.displaySubMenu(menu: frozenCustarList)
            menuStep = 1
            menuNumber = 1
        case 3:
            burgersMenu.displaySubMenu(menu: drinkList)
            menuStep = 1
            menuNumber = 2
        case 4:
            beerMenu.displaySubMenu(menu: beerList)
            menuStep = 1
            menuNumber = 3
        case 5:
            print("\n아래와 같이 주문하시겠습니까?\n")
            print("[ Orders ]")
            
            for order in orderList{
                order.diplayBasketInfo()
                orderTotal += order.price
            }
            orderList.last!.orderResult(totalPrice: orderTotal)
            break
        case 6:
            print("진행중인 주문을 취소합니다.")
            orderList.removeLast()
            if orderList.isEmpty{ // 주문 목록이 없을시 ORDER MENU 안나옴
                fristExplainMenu()
            }else{
                orderList.last!.orderDisplay()
            }
            break
        default:
            break
        }
        
    }
    
    let input = Int(readLine()!) // 기존 input
    
    if input == 0{
        if menuStep == 0{
            print("프로그램을 종료합니다.")
            break
        }else{
            menuStep = 0
        }
    }
    if menuStep == 0{ // 메인메뉴 일때
        switch input {
        case 0:
            fristExplainMenu()
            menuStep = 0
        case 1:
            burgersMenu.displaySubMenu(menu: bugerList)
            menuStep = 1
            menuNumber = 0
        case 2:
            frozenCustardMenu.displaySubMenu(menu: frozenCustarList)
            menuStep = 1
            menuNumber = 1
        case 3:
            drinksMenu.displaySubMenu(menu: drinkList)
            menuStep = 1
            menuNumber = 2
        case 4:
            burgersMenu.displaySubMenu(menu: beerList)
            menuStep = 1
            menuNumber = 3
        default:
            print("잘못된 번호를 입력했어요 다시 입력해주세요.")
        }
      
    }else{ // // 서브 메뉴판 일때
        let detailMenu = menuList[menuNumber] // 서브 메뉴판
        let orderNum = (input ?? 0) - 1 // 서브 메뉴판에서 정한 품목
        var orderStatus = -1 // 1 : 확인 , 2 취소
        if orderNum >= detailMenu.mainMenuCnt || input == nil{
            print("잘못된 번호를 입력했어요 다시 입력해주세요.")
        }else{
            var order = Order(name: bugerList[orderNum].name, price: bugerList[orderNum].price, explains: bugerList[orderNum].explains)
            switch detailMenu.mainMenuNum{
            case 1:
                order = Order(name: frozenCustarList[orderNum].name, price: frozenCustarList[orderNum].price, explains: frozenCustarList[orderNum].explains)
            case 2:
                order = Order(name: bugerList[orderNum].name, price: bugerList[orderNum].price, explains: bugerList[orderNum].explains)
            case 3:
                order = Order(name: drinkList[orderNum].name, price: drinkList[orderNum].price, explains: drinkList[orderNum].explains)
            case 4:
                order = Order(name: beerList[orderNum].name, price: beerList[orderNum].price, explains: beerList[orderNum].explains)

            default:
                break
            }
            order.diplayBasketInfo()
            print("위 메뉴를 장바구니에 추가하시겠습니까?")
            print("1. 확인        2. 취소")
            while orderStatus != 2{
                orderStatus = Int(readLine()!) ?? -1
                if orderStatus == 1{
                    print("\(order.name)가 장바구니에 추가되었습니다.")
                    orderList.append(order)
                    menuStep = 0
                    break
                }else if orderStatus == 2{
                    print("취소 되었습니다.")
                    menuStep = 0
                    fristExplainMenu()
                }else{
                    print("잘못된 번호를 입력했어요 다시 입력해주세요.")
                }
            }
        }
     
 
    }
}
//MARK: - 첫번째 메뉴판
func fristExplainMenu(){
    burgersMenu.welcomeText()
    for menu in menuList{
        menu.displayInfo()
    }
}
