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
    var name: String
    @Relationship(deleteRule:.cascade) var entries: [Entry]
    init(name: String) {
        self.name = name
        entries = []
    }
}

extension Item {
    @Transient var checkingDate: Date {
        let _ = entries
        //...
        return Date()
    }
}

