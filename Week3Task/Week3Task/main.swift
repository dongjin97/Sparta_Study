//
//  main.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/04.
//

import Foundation
//MARK: - MENU
let burgersMenu = ShackShackMenu(mainMenuNum: 1, mainMenuName: "Burgers", mainMenuInfo: "앵거스 비프 통살을 다져만든 버거")
let frozenCustardMenu = ShackShackMenu(mainMenuNum: 2, mainMenuName: "Frozen CustardMenu", mainMenuInfo: "매장에서 신선하게 만드는 아이스크림")
let drinksMenu = ShackShackMenu(mainMenuNum: 3, mainMenuName: "Drinks", mainMenuInfo: "매장에서 직접 만드는 음료")
let beerMenu = ShackShackMenu(mainMenuNum: 4, mainMenuName: "Beer", mainMenuInfo: "뉴욕 브루클린 브루어리에서 양조한 맥주")
let exit = ShackShackMenu(mainMenuNum: 0, mainMenuName: "종료", mainMenuInfo: "프로그램 종료")
//MARK: - Buger
let shackBurger = Buger(menuNumber:1,name: "ShackBurger", price: 6.9, explains: "토마토, 양상추, 쉑소스가 토핑된 치즈버거")
let smokeShack = Buger(menuNumber:2,name: "SmokeShack", price: 8.9, explains: "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거")
let shroomBurger = Buger(menuNumber: 3, name: "Shroom Burger", price: 9.4, explains: "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거")
let cheeseburger = Buger(menuNumber: 4, name: "Cheeseburger", price: 6.9, explains: "포테이토 번과 비프패티, 치즈가 토핑된 치즈버거")
let hamburger = Buger(menuNumber: 5, name: "Hamburger", price: 5.4, explains: "비프패티를 기반으로 야채가 들어간 기본버거")

let shake = FrozenCustar(menuNumber: 1, name: "Shake", price: 6.5, explains: "바닐라, 초콜렛, 솔티드 카라멜, 블랙 & 화이트,스토로 베리,피넛버터, 커피")
let shakOfTheWeek = FrozenCustar(menuNumber: 2, name: "Shake of the Week", price: 6.5, explains: "특별한 커스터드 플레이버")
let redBeanShake = FrozenCustar(menuNumber: 3, name: "Red Bean Shake", price: 6.5, explains: "신선한 커스터드와 함께 우유와 레드빈이 블렌딩 된 시즈널 쉐이크")
let floats = FrozenCustar(menuNumber: 4, name: "Floats", price: 4.9, explains: "루트비어, 퍼플 카우, 크림시클")
let cupsCones = FrozenCustar(menuNumber: 5, name: "Cups & Cones", price: 4.9, explains: "바닐라, 초콜렛, Flavor of the Week")
let concretes = FrozenCustar(menuNumber: 6, name: "Concretes", price: 5.9, explains: "쉐이크쉐의 쫀득한 커스터드와 다양한 믹스-인의 조합")

let shackMadeLemonade = Drinks(menuNumber: 1, name: "Shack-made Lemonade", price: 3.9, explains: "매장에서 직접 만드는 상큼한 레몬에이드 (오리지날/시즈널)")
let freshBrewedIcedTea = Drinks(menuNumber: 2, name: "Fresh Brewed Iced Tea", price: 3.4, explains: "직접 유기농 홍차를 우려낸 아이스티")
let fifty = Drinks(menuNumber: 3, name: "Fifty/Fifty ", price: 3.5, explains: "레몬에이드와 아이스티의 만남")
let fountainSoda = Drinks(menuNumber: 4, name: "Fountain Soda", price: 2.7, explains: "코카콜라, 코카콜라 제로, 스프라이트, 환타오렌지, 환타 그레이프")
let abitaRootBeer = Drinks(menuNumber: 5, name: "Abita Root Beer", price: 4.4, explains: "청량감 있는 독특한 미국식 무알콜 탄산음료")
let bottledWater = Drinks(menuNumber: 6, name: "Bottled Water", price: 1.0, explains: "지리산 암반대수층으로 만든 프리미엄 생수")

let shackMeisterAle = Beer(menuNumber: 1, name: "ShackMeister Ale", price: 9.8, explains: "쉐이크식 버거를 위해 뉴욕 브루클린 브루어리에서 특별히 양조한 에일 맥주")
let magpieBrewing = Beer(menuNumber: 2, name: "Magpie Brewing Co.", price: 6.8, explains: "Pale Ale, Draft")

let menuList : [ShackShackMenu] = [burgersMenu,frozenCustardMenu,drinksMenu,beerMenu,exit]

let bugerList : [Buger] = [shackBurger,smokeShack,shroomBurger,cheeseburger,hamburger]
let frozenCustarList : [FrozenCustar] = [shake,shakOfTheWeek,redBeanShake,floats,cupsCones,concretes]
let drinkList : [Drinks] = [shackMadeLemonade,freshBrewedIcedTea,fifty,fountainSoda,abitaRootBeer,bottledWater]
let beerList : [Beer] = [shackMeisterAle,magpieBrewing]

print("아래 메뉴판을 보시고 메뉴를 골라 입력해주세요\n[ SHAKESHACK MENU ]")

var menuStep = 0

for menu in menuList{
    menu.displayInfo()
}

while true {
    let input = readLine()
    // 0 : 제일 상단메뉴 스텝
    if input == "0" && menuStep == 0{
        print("프로그램을 종료합니다.")
        break
    }
    switch input {
    case "0":
        print("\n아래 메뉴판을 보시고 메뉴를 골라 입력해주세요\n[ SHAKESHACK MENU ]")
        for menu in menuList{
            menu.displayInfo()
        }
        menuStep = 0
    case "1":
        burgersMenu.displayMenu()
        for buger in bugerList{
            buger.displayInfo()
        }
        burgersMenu.backMenu()
        menuStep = 1
    case "2":
        frozenCustardMenu.displayMenu()
        for frozenCustar in frozenCustarList{
            frozenCustar.displayInfo()
        }
        menuStep = 1
        drinksMenu.backMenu()
    case "3":
        drinksMenu.displayMenu()
        for drink in drinkList{
            drink.displayInfo()
        }
        drinksMenu.backMenu()
        menuStep = 1
    case "4":
        beerMenu.displayMenu()
        for beer in beerList{
            beer.displayInfo()
        }
        beerMenu.backMenu()
        menuStep = 1
    default:
        print("잘못된 번호를 입력했어요 다시 입력해주세요.")
    }
}

