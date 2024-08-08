//
//  Task.swift
//  To-Do-List
//
//  Created by Roman Pasqualone on 7/18/24.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    
    var name: String
    var deadline: Date
    var isComplete: Bool
    var isRepeated: Bool
    var hasDeadline: String
    var description: String
    var steps: [String]
}

let taskData = [
    Task(name: "Clean House", deadline: Date(), isComplete: false, isRepeated: false, hasDeadline: "No", description: "Gotta Clean your house super duper good", steps: ["clean bathroom", "Mop Floor"]),
    Task(name: "Clean Smouse", deadline: Date(), isComplete: false, isRepeated: false, hasDeadline: "Yes", description: "Gotta clean your house kinda sorta good", steps: ["Clean Smathroom", "Mop Smoor"])
]

