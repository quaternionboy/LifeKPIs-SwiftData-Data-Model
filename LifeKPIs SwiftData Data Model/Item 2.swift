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
    init(name: String) {
        self.name = name
    }
}

extension Item {
    @Transient var checkingDate: Date {
        if let last = entries.sorted(by: {$0.date<$1.date}).last{
            //....
            return Date()
        }else{
           //...
            return Date()
        }
    }
}
