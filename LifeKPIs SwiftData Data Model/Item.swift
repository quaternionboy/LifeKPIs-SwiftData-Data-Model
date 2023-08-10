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
    @Transient var checkingDate: Date? {
        if let last = entries.sorted(by: {$0.date<$1.date}).last{
            return Calendar.current.startOfDay(for: last.date.addingTimeInterval(86_400))
        }else{
            return Calendar.current.startOfDay(for: Date(timeIntervalSinceNow: -86_400 * 10))
        }
    }
}
