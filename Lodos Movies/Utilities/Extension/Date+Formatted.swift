//
//  Date+Formatted.swift
//  Lodos Movies
//
//  Created by Tuğrul on 15.03.2024.
//


import Foundation

extension Date {
    
    /// Generates the current date in Timestamp type.
    /// - Returns: Timestamp's Int64 format
    func currentTimestamp() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    
    var currentTimestampSTR: String {
        return "\(self.currentTimestamp())"
    }
}
