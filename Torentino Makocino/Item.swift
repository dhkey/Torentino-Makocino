//
//  Item.swift
//  Torentino Makocino
//
//  Created by Denis Yazan on 26.07.2025.
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
