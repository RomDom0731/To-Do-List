//
//  TaskCreator.swift
//  To-Do-List
//
//  Created by Roman Pasqualone on 7/31/24.
//

import SwiftUI

struct TaskDetails: View {
    @State var task: Task
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(task.name)")
                .font(.system(size: 50))
            Text("\(task.description)")
            ForEach(task.steps, id: \.self) { step in
                Text(step.name)
                    .foregroundStyle(.secondary)
            }
            Button("Add Step", action: addStep)
        }
    }
    
    func addStep(){
        task.steps.append(Step(name: "This is a step", isComplete: false))
    }
}


