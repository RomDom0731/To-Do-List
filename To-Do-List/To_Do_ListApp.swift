//
//  To_Do_ListApp.swift
//  To-Do-List
//
//  Created by Roman Pasqualone on 7/18/24.
//

import SwiftUI

@main
struct To_Do_ListApp: App {
    @StateObject private var list = TaskList()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(list)
        }
    }
}
