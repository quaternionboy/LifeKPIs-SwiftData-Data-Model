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
    
    let container: ModelContainer 
    
    var itemsToCheck: [Item] = []
    
    init(previewContainer: ModelContainer? = nil) {
        
        if let previewContainer = previewContainer {
            self.container = previewContainer
        }else{
            self.container = try! ModelContainer(for: [Item.self])
        }
    }
}

extension DataManager {
    @MainActor func updateItemsToCheck(){
        itemsToCheck = try! container.mainContext.fetch(FetchDescriptor<Item>())
            .filter {$0.checkingDate != nil && $0.checkingDate!<=Calendar.current.startOfDay(for:Date())}
            .sorted {$0.checkingDate!<$1.checkingDate!}
    }
}

