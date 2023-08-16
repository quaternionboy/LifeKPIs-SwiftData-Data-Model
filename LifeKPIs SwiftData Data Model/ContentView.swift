//
//  ContentView.swift
//  LifeKPIs SwiftData Data Model
//
//  Created by Ferran Canals on 22/6/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Item.name) private var items: [Item]
    @Environment(\.modelContext) private var context
    var body: some View {
        let _ = Self._printChanges()
        List{
            ForEach(items){item in
                Text("Name:\(item.name), checking date: \(item.checkingDate, format: Date.FormatStyle(date: .numeric, time: .standard))")
            }
        }.onAppear{
            let item = Item(name:"Item name")
            let entry = Entry(value: 0, date: Date())
            item.entries.append(entry)
            context.insert(item)
        }
    }
}

//#Preview {
//    return NavigationStack{
//        ContentView()
//            .modelContainer(ModelCon...)
//    }
//}
