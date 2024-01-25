//
//  TodoListCompletedModl.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2024/01/09.
//

import Foundation
struct TodoListCompleted{ // TodoList 전체  구조
    var category : String
    var list : [TodoListContentComplted]
}
struct TodoListContentComplted{
    var title : String
    var date : Date
}

