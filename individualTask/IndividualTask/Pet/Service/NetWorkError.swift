//
//  NetWorkError.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2024/01/12.
//

import Foundation
enum NetworkError : Error{
    case emptyResponse
    case invalidResponse
    case unKnown(String)
    case decodeError
}
