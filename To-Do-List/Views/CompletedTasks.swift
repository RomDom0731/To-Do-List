//
//  CompletedTasks.swift
//  To-Do-List
//
//  Created by Roman Pasqualone on 8/7/24.
//

import SwiftUI

struct CompletedTasks: View {
    @EnvironmentObject var list: TaskList
    
    var body: some View {
        NavigationView{
            List{
                ForEach(list.tasks) { task in
                    if (task.isComplete){
                        NavigationLink(destination: TaskDetails(task: task)){
                            VStack (alignment: .leading) {
                                Text("\(task.name)")
                                if (task.hasDeadline == "Yes"){
                                    Text("Task deadline: \(task.deadline.formatted())")
                                        .font(.caption)
                                }
                            }
                        }
                    }
                }
            }
            .toolbar(content: {
                #if os(iOS)
                ToolbarItem(placement: .topBarLeading){
                    EditButton()
                }
                #endif
            })
            .navigationTitle("Completed Tasks")
        }
    }
}

struct CompletedTasks_Previews: PreviewProvider {
    static var previews: some View {
        CompletedTasks()
            .environmentObject(TaskList())
    }
}
