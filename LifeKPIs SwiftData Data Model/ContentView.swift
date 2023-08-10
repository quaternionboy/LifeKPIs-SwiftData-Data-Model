//
//  ContentView.swift
//  LifeKPIs SwiftData Data Model
//
//  Created by Ferran Canals on 22/6/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var isPresented: Bool = false
    var body: some View {
        NavigationStack{
            TabView{
                CheckView().tabItem { Text("Check") }
                ListView().tabItem { Text("List") }
            }
            .toolbar{
                ToolbarItem(placement:.topBarLeading){
                    Button("Dev Tools"){
                        isPresented.toggle()
                    }
                }
            }
            .sheet(isPresented: $isPresented){
                DevToolsView()
            }
        }
    }
}

#Preview {
    let dataManager = DataManager(previewContainer: previewContainer)
    return NavigationStack{
        ContentView()
            .modelContainer(dataManager.container)
            .environment(dataManager)
    }
}
