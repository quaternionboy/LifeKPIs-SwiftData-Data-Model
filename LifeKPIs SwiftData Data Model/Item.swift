//
//  Item.swift
//  LifeKPIs SwiftData Data Model
//
//  Created by Ferran Canals on 22/6/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
