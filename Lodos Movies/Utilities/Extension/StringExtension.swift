//
//  StringExtension.swift
//  Lodos Movies
//
//  Created by Tuğrul on 15.03.2024.
//

extension Optional where Wrapped == String {
    var isNullOrEmpty: Bool {
        if let self = self, !self.isEmpty {
            return true
        } else {
             return false
        }
    }
}
