//
//  ListView.swift
//  LifeKPIs SwiftData Data Model
//
//  Created by Ferran Canals on 28/7/23.
//

import SwiftUI
import SwiftData

struct ListView: View {
    @Query private var items: [Item]
    @Environment(DataManager.self) private var dataManager
    var body: some View {
        List{
            Button("+"){
                let item = Item(name: "Item\(items.count)")
                dataManager.container.mainContext.insert(item)
            }
            ForEach(items){item in
                Text(item.name)}
        }
    }
}

//#Preview {
//    MainActor.assumeIsolated{
//        ListView()
//            .modelContainer(for: [Item.self, Entry.self], inMemory: true)
//            .environment(DataManager())
//    }
//}
