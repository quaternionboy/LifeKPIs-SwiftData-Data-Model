//
//  Entry.swift
//  LifeKPIs SwiftData Data Model
//
//  Created by Ferran Canals on 28/7/23.
//

import Foundation
import SwiftData

@Model final class Entry {
    var value: Int
    var date: Date
    init(value: Int, date: Date) {
        self.value = value
        self.date = date
    }
}
