//
//  DevToolsView.swift
//  LifeKPIs SwiftData Data Model
//
//  Created by Ferran Canals on 9/8/23.
//

import SwiftUI
import SwiftData

struct DevToolsView: View {
    @Query private var items: [Item]
    @Query private var entries: [Entry]
    var body: some View {
        List{
            Section("Items"){
                ForEach(items){
                    Text($0.name)
                }
            }
            Section("Entries"){
                ForEach(entries){
                    Text("\($0.date, format: Date.FormatStyle(date: .numeric, time: .standard))")
                }
            }
        }
    }
}

#Preview {
    DevToolsView()
}
