//
//  Preview.swift
//  LifeKPIs SwiftData Data Model
//
//  Created by Ferran Canals on 28/7/23.
//

import Foundation
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
   
        let container = try! ModelContainer(
            for: [Item.self,Entry.self], ModelConfiguration(inMemory: true)
        )

        return container
    
}()
