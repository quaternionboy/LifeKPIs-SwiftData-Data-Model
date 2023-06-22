//
//  LifeKPIs_SwiftData_Data_ModelApp.swift
//  LifeKPIs SwiftData Data Model
//
//  Created by Ferran Canals on 22/6/23.
//

import SwiftUI
import SwiftData

@main
struct LifeKPIs_SwiftData_Data_ModelApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
