//
//  Helpers.swift
//  LifeKPIs SwiftData Data Model
//
//  Created by Ferran Canals on 28/7/23.
//

import Foundation

import Dispatch
func delay(seconds: Double, completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        completion()
    }
}
