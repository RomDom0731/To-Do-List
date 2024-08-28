//
//  Task.swift
//  To-Do-List
//
//  Created by Roman Pasqualone on 7/18/24.
//

import Foundation

struct Step: Codable, Equatable, Identifiable, Hashable{
    var id = UUID()
    var name: String
    var isComplete: Bool
    
}

struct Task: Identifiable, Codable, Equatable, Hashable{
    var id = UUID()
    
    var name: String
    var deadline: Date
    var isComplete: Bool
    var isRepeated: Bool
    var hasDeadline: String
    var description: String
    var steps: [Step]
}

