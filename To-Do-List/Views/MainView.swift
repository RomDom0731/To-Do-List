//
//  MainView.swift
//  To-Do-List
//
//  Created by Roman Pasqualone on 8/7/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView(list: testList)
                .tabItem {
                    Label("Current Tasks", systemImage: "list.dash")
                }
            ExpiredTasks()
                .tabItem {
                    Label("Expired Tasks", systemImage: "xmark")
                }
            CompletedTasks()
                .tabItem {
                    Label("Completed Tasks", systemImage: "checkmark")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(TaskList())
    }
}
