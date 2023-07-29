//
//  ContentView.swift
//  LifeKPIs SwiftData Data Model
//
//  Created by Ferran Canals on 22/6/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView{
            CheckView().tabItem { Text("Check") }
            ListView().tabItem { Text("List") }
        }
    }
}

#Preview {
    let dataManager = DataManager(previewContainer: previewContainer)
    return ContentView()
        .modelContainer(dataManager.container)
        .environment(dataManager)
}
