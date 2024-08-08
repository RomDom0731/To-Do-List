//
//  TaskList.swift
//  To-Do-List
//
//  Created by Roman Pasqualone on 7/31/24.
//

import Foundation

class TaskList: ObservableObject{
    @Published var tasks = [Task]()
    
    init(tasks: [Task] = []) {
        self.tasks = tasks
    }
}

let testList = TaskList(tasks: taskData)
