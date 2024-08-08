//
//  TaskCreator.swift
//  To-Do-List
//
//  Created by Roman Pasqualone on 7/31/24.
//

import SwiftUI

struct TaskDetails: View {
    var task: Task
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(task.name)")
                .font(.system(size: 50))
            Text("\(task.description)")
            ForEach(task.steps, id: \.self) { step in
                Text(step)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    TaskDetails(task: taskData[0])
}
