//
//  TaskStorage.swift
//  To-Do Manager
//
//  Created by Vladislav on 08.02.2022.
//

import Foundation

protocol TaskStorageProtocol{
    func loadTasks() -> [TaskProtocol]
    //func saveTasks(_ tasks: [TaskProtocol])
}

class TaskStorage: TaskStorageProtocol{

    func loadTasks() -> [TaskProtocol] {
        let testTasks: [TaskProtocol] = [
            Task(title: "swim", type: .normal, status: .planned),
            Task(title: "resume", type: .important, status: .planned),
            Task(title: "sleep", type: .normal, status: .complited),
            Task(title: "go Perm", type: .normal, status: .planned),
            Task(title: "Пригласить на вечеринку Дольфа, Джеки, Леонардо, Уилла и Брюса", type: .important, status: .planned)]
        return testTasks
    }
    
//    func saveTasks(_ tasks: [TaskProtocol]) {
//        return
//    }
}
