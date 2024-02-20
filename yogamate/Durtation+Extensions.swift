//
//  Durtation+Extensions.swift
//  yogamate
//
//  Created by Monica Rondón on 12.02.24.
//  


import Foundation
import SwiftUI

extension TimeInterval {

    init(hr: Int = 0, min: Int = 0, sec: Int = 0, mill: Int = 0) {
        let timeInterval = (hr * 3600) + (min * 60) + sec + (mill/1000)
        self.init(timeInterval)
    }
}

extension Text {

    public struct TimeIntervalStyleOptionSet: OptionSet {
        public let rawValue: Int

        public static let milliseconds = Self(rawValue: 1 << 0)
        public static let seconds = Self(rawValue: 1 << 1)
        public static let minutes = Self(rawValue: 1 << 2)
        public static let hours = Self(rawValue: 1 << 3)

        public static let all: Self = [.hours, .minutes, .seconds, .milliseconds]
        public static let minSecMill: Self = [.minutes, .seconds, .milliseconds]

        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }

//    init(timeInterval: TimeInterval, style: TimeIntervalStyleOptionSet = .all) {
//        let duration = Duration(secondsComponent: Int64(timeInterval), attosecondsComponent: 0)
//        if style.contains(.hours) {
//
//        }
//    }

}
