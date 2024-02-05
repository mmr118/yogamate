//
//  Item.swift
//  yogamate
//
//  Created by Monica Rondón on 2/5/24.
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
