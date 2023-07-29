//
//  CheckView.swift
//  LifeKPIs SwiftData Data Model
//
//  Created by Ferran Canals on 28/7/23.
//

import SwiftUI

struct CheckView: View {
    @Environment(DataManager.self) private var dataManager
    var body: some View {
        List{
            ForEach(dataManager.itemsToCheck){item in
                Section(item.name){
                    Button("+"){
                        let entry = Entry(value: 0, date: item.checkingDate!)
                        item.entries.append(entry)
                        dataManager.container.mainContext.insert(entry)
                        dataManager.updateItemsToCheck()
                    }
                    Text("ENTRIES:")
                    ForEach(item.entries.sorted{$0.date<$1.date}){ entry in
                        Text("\(entry.date, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    }
                    Text("CHECKING:")
                    Text("\(item.checkingDate!, format: Date.FormatStyle(date: .numeric, time: .standard))")
                }
            }
        }
        .onAppear{dataManager.updateItemsToCheck()}
    }
}

//#Preview {
//    CheckView()
//}
