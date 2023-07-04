//
//  DataManager.swift
//  LifeKPIs SwiftData Data Model
//
//  Created by Ferran Canals on 28/6/23.
//

import Foundation
import SwiftData
import Observation

@Observable
class DataManager {
    static let container = try! ModelContainer(for: Item.self)
    @MainActor static func addItem(){
        let newItem = Item(timestamp: .now)
        container.mainContext.insert(newItem)
    }
}

