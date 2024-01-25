//
//  RemoteProduct.swift
//  WishList
//
//  Created by 원동진 on 2024/01/05.
//

import Foundation
struct RemoteProdcut : Decodable {
    let id : Int
    let title : String
    let description : String
    let price : Double
    let thumbnail : URL
}
