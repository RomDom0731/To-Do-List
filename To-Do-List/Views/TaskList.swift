//
//  TaskList.swift
//  To-Do-List
//
//  Created by Roman Pasqualone on 7/31/24.
//

import Foundation

class TaskList: ObservableObject {
    @Published var tasks: [Task] = []

    private let key = "TaskData"

    init() {
        self.tasks = load(key: key)
    }

    func save() {
        save(tasks: tasks, key: key)
    }
    
    private func save(tasks: [Task], key: String) {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    private func load(key: String) -> [Task] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        return (try? JSONDecoder().decode([Task].self, from: data)) ?? []
    }
}
