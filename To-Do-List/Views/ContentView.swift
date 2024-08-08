//
//  ContentView.swift
//  To-Do-List
//
//  Created by Roman Pasqualone on 7/18/24.
//

import SwiftUI


struct ContentView: View {
    var dateTime: String {
            let today = Date()
            let formatter1 = DateFormatter()
            formatter1.dateStyle = .short
            return formatter1.string(from: today)
        }
    
    @State private var date = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        
        DatePicker(
                "Skibidi",
                 selection: $date,
                 in: dateRange,
                 displayedComponents: [.date, .hourAndMinute]
            )
        }
    }

#Preview {
    ContentView()
}
