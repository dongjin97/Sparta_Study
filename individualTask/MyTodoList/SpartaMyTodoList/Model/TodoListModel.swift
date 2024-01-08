//
//  TodoListModel.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2023/12/11.
//

import Foundation
import UIKit
struct TodoList : Codable{
    var category : String
    var list : [TodoListContent]
}
struct TodoListContent : Codable{
    var title : String
    var isCompleted : Bool
    var date : Date
}
