//
//  TodoListManager.swift
//  SpartaMyTodoList
//
//  Created by 원동진 on 2024/01/08.
//

import Foundation
class TodoListManager {
    static let shared = TodoListManager()
    private let todoListKey = "TodoList"

       private init() {}

       func saveTodoList(todoList: [TodoList]) {
           let encoder = JSONEncoder()
           if let encodedData = try? encoder.encode(todoList) {
               UserDefaults.standard.set(encodedData, forKey: todoListKey)
           }
       }

       func loadTodoList() -> [TodoList] {
           let decoder = JSONDecoder()
           if let savedData = UserDefaults.standard.data(forKey: todoListKey),
               let todoList = try? decoder.decode([TodoList].self, from: savedData) {
               return todoList
           }
           return []
       }
}
