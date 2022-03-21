//
//  TaskStorage.swift
//  To-Do Manager
//
//  Created by Vladislav on 08.02.2022.
//

import Foundation

protocol TaskStorageProtocol{
    func loadTasks() -> [TaskProtocol]
    func saveTasks(_ tasks: [TaskProtocol])
}

class TaskStorage: TaskStorageProtocol{

    private var storage = UserDefaults.standard
    var storageKey: String = "tasks"
    
    private enum Taskkey: String{
        case title
        case type
        case status
    }
    
    
    
    func loadTasks() -> [TaskProtocol] {
        var resoultTask: [TaskProtocol] = []
        let taskFromStorage = storage.array(forKey: storageKey) as? [[String:String]] ?? []
        for task in taskFromStorage {
            guard let title = task[Taskkey.title.rawValue],
                  let typeRaw = task[Taskkey.type.rawValue],
                  let statusRaw = task[Taskkey.status.rawValue] else {
                      continue
                  }
            let type: TaskPriority = typeRaw == "important" ? .important : .normal
            let status: TaskStatus = statusRaw == "planned" ? .planned : .complited
            resoultTask.append(Task(title: title, type: type, status: status))
        }
        return resoultTask
    }
        
    func saveTasks(_ tasks: [TaskProtocol]) {
        var arrayFromStorage: [[String:String]] = []
        tasks.forEach { task in
            var newElementForStorage: Dictionary <String, String> = [:]
            newElementForStorage[Taskkey.title.rawValue] = task.title
            newElementForStorage[Taskkey.type.rawValue] = (task.type == .important) ? "important" : "normal"
            newElementForStorage[Taskkey.status.rawValue] = (task.status == .complited) ? "complited" : "planned"
            arrayFromStorage.append(newElementForStorage)
        }
        storage.set(arrayFromStorage, forKey: storageKey)
    }
}
    
