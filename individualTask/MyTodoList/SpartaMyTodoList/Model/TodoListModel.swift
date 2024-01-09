//
//  TodoListModel.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2023/12/11.
//

import Foundation
import UIKit
// Codable설정이유 decode와 encode 모두 이루어짐
struct TodoList : Codable{ // TodoList 전체  구조
    var category : String
    var list : [TodoListContent]
}
struct TodoListContent : Codable{ // TodoList 하나에 대한 구조
    var title : String
    var isCompleted : Bool
    var date : Date
}
