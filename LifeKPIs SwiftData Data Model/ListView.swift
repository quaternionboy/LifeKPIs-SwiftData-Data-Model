//
//  ListView.swift
//  LifeKPIs SwiftData Data Model
//
//  Created by Ferran Canals on 28/7/23.
//

import SwiftUI
import SwiftData

    struct ListView: View {
        @Query(sort: \Item.name) private var items: [Item]
        @Environment(DataManager.self) private var dataManager
        var body: some View {
            List{
                EditButton()
                Button("+"){
                    let item = Item(name: "Item\(items.count)")
                    dataManager.container.mainContext.insert(item)
                }
                ForEach(items){item in
                    Text(item.name)}
                .onDelete(perform: { indexSet in
                        for index in indexSet {
                            dataManager.container.mainContext.delete(items[index])
                            dataManager.updateItemsToCheck()
                        }
                })
            }
        }
    }

#Preview {
    let dataManager = DataManager(previewContainer: previewContainer)
    return NavigationStack{
        ListView()
            .modelContainer(dataManager.container)
            .environment(dataManager)
    }
}
