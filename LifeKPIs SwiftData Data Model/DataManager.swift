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
            self.container = try! ModelContainer(for: [Item.self, Entry.self])
        }
    }
}

extension DataManager {
    @MainActor func updateItemsToCheck(){
        
        let items: [(item:Item, checkingDate:Date?)] = {
            let items: [Item] =  try! container.mainContext.fetch(FetchDescriptor<Item>()) //TBI try!
            return items
                .map {($0,
                       $0.checkingDate)}
                .filter {$0.checkingDate != nil}
                .sorted {$0.checkingDate!<$1.checkingDate!}
        }()
        
        itemsToCheck = items
            .filter{$0.checkingDate!<=Calendar.current.startOfDay(for:Date())}
            .map{$0.item}
//            .sorted{$0.objectID<$1.objectID}//workaround
    }
}

