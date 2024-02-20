//
//  Item.swift
//  yogamate
//
//  Created by Monica Rondón on 2/5/24.
//  


import Foundation
import SwiftData

@Model
final class Countdown {
    
    var timestamp: Date

    var duration: Duration

    init(duration: Duration) {
        self.timestamp = .init()
        self.duration = duration
    }
}
