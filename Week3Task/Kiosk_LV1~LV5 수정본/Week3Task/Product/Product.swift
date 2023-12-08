//
//  Meny.swift
//  Week3Task
//
//  Created by 원동진 on 2023/12/06.
//

import Foundation
class Product{
    let menuNumber : Int
    var name : String
    let price : Double
    let explains : String
    init(menuNumber: Int, name: String, price: Double, explains: String) {
        self.menuNumber = menuNumber
        self.name = name
        self.price = price
        self.explains = explains
    }
    func displayInfo(){
        print("\(menuNumber). \(name) | W \(price) | \(explains)")
    }
}

