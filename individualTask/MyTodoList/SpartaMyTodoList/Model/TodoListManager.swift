//
//  TodoListManager.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2024/01/08.
//

import Foundation
class TodoListManager { // Struct같은 경우 UserDefaults사용시 아카이빙 언카이빙 작업이 별로로 필요
    static let shared = TodoListManager()
    private let todoListKey = "TodoList"
       private init() {}
       func saveTodoList(todoList: [TodoList]) {
           let encoder = JSONEncoder()
           if let encodedData = try? encoder.encode(todoList) { // 아카이빙
               UserDefaults.standard.set(encodedData, forKey: todoListKey)
           }
       }

       func loadTodoList() -> [TodoList] {
           let decoder = JSONDecoder()
           if let savedData = UserDefaults.standard.data(forKey: todoListKey),
               let todoList = try? decoder.decode([TodoList].self, from: savedData) { // 언아카이빙
               return todoList
           }
           return []
       }
}
