//
//  CoreDataManger.swift
//  IndividualTask
//
//  Created by 원동진 on 1/31/24.
//

import Foundation
import CoreData
import UIKit
class CoreDataManger{
    static let shared = CoreDataManger()
    var persistentContainer: NSPersistentContainer? {
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    }
    var context : NSManagedObjectContext {
        return self.persistentContainer!.viewContext
    }
    let request = Task.fetchRequest()
    func fetchTasksData()->[Task]{
        var taskList : [Task] = [Task]()
        do {
            let tasks = try context.fetch(request)
            taskList = tasks
        }catch{
            print("Error fetchData: \(error)")
        }
        return taskList
    }
    func addTaskData(_ title : String){
        let newTask = Task(context: context)
        newTask.id = UUID()
        newTask.title = title
        newTask.createDate = Date()
        newTask.modifyData = Date()
        newTask.isCompleted = false
        try? context.save()
    }
    func updateTaskData(taskList : [Task],indexPath : IndexPath,isOn :Bool){
        do {
            let tasks = try context.fetch(request)
            let filterTask = tasks.filter{$0.id == taskList[indexPath.item].id}[0]
            filterTask.modifyData = Date()
            filterTask.isCompleted = isOn
            try context.save()
        }catch {
            print("Error Update: \(error)")
        }
    }
    func deleteTaks(taskList: [Task],indexPath: IndexPath){
        do {
            let tasks = try context.fetch(request)
            let filterTask = tasks.filter{$0.id == taskList[indexPath.item].id}[0]
            context.delete(filterTask)
            try context.save()
        }catch{
            print("Error delete : \(error)")
        }
    }
}
