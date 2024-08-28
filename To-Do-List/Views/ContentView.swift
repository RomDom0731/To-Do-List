//
//  ContentView.swift
//  To-Do-List
//
//  Created by Roman Pasqualone on 7/18/24.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var list: TaskList
    
    
    @State private var isAdding = false
    @State private var taskName = ""
    @State private var date = Date()
    @State private var presentPopup = false
    @State private var presentPopup2 = false
    @State private var taskDescription = ""
    @State private var taskHasDeadline = "No"
    var choices = ["Yes", "No"]
    private let key = "TaskData"
    
    func addTask(){
        withAnimation{
            list.tasks.append(Task(name: taskName, deadline: date, isComplete: false, isRepeated: false, hasDeadline: taskHasDeadline, description: taskDescription, steps: []))
        }
        taskName = ""
        taskDescription = ""
        taskHasDeadline = "No"
        date = Date()
        list.save()
        presentPopup.toggle()
    }
    
    func moveTask(from: IndexSet, to: Int){
        withAnimation{
            list.tasks.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteTask(offsets: IndexSet){
        list.tasks.remove(atOffsets: offsets)
        list.save()
    }
    
    func closePopup(){
        taskName = ""
        taskDescription = ""
        taskHasDeadline = "No"
        date = Date()
        presentPopup.toggle()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach($list.tasks) { $task in
                    if ((task.hasDeadline == "No" || task.deadline > Date.now) && !task.isComplete){
                        NavigationLink(destination: TaskDetails(task: task)){
                            VStack (alignment: .leading) {
                                HStack{
                                    Image(systemName: task.isComplete ? "checkmark.circle" : "circle")
                                        .onTapGesture {
                                            task.isComplete.toggle()
                                            list.save()
                                        }
                                    Text("\(task.name)")
                                }
                                if (task.hasDeadline == "Yes"){
                                    Text("Task deadline: \(task.deadline.formatted())")
                                        .font(.caption)
                                }
                            }
                        }
                    }
                }
                .onDelete(perform: deleteTask)
                .onMove(perform: moveTask)
            }
            .toolbar(content: {
                #if os(iOS)
                ToolbarItem(placement: .topBarLeading){
                    EditButton()
                }
                #endif
                
                ToolbarItem(placement: .topBarTrailing){
                    Button("Add", systemImage: "plus") {
                        presentPopup = true
                    }
                    .popover(isPresented: $presentPopup, attachmentAnchor: .point(.center), arrowEdge: .top) {
                        VStack {
                            TextField("Task Name", text: $taskName)
                                .padding()
                                .textFieldStyle(.roundedBorder)
                            TextField("Task Description", text: $taskDescription)
                                .padding()
                                .textFieldStyle(.roundedBorder)
                            HStack{
                                Text("Does the task have a deadline?")
                                Picker("Does the task have a deadline?", selection: $taskHasDeadline){
                                    ForEach(choices, id: \.self){
                                        Text($0)
                                    }
                                }
                            }
                            if (taskHasDeadline == "Yes"){
                                withAnimation{
                                    DatePicker("Deadline", selection: $date, in: Date.now...)
                                        .padding()
                                }
                            }
                            HStack {
                                Button("Create", action: addTask)
                                    .disabled(taskName.isEmpty || taskDescription.isEmpty)
                                Button("Cancel", action: closePopup)
                            }
                        }
                        .presentationDetents([.height(300)])
                    }
                }
            })
            .navigationTitle("Current Tasks")
        }
    }
}
    
struct ContentView_Preview: PreviewProvider {
    static var previews: some View{
        ContentView()
            .environmentObject(TaskList())
    }
}
