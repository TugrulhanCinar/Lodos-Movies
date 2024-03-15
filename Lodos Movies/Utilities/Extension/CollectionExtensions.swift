//
//  CollectionExtensions.swift
//  Lodos Movies
//
//  Created by Tuğrul on 14.03.2024.
//

import Foundation

public extension Collection {

    /// Safe subscript, returns the element if index within bounds, nil otherwise
    ///
    /// - Parameter index: Index of the desired element
    subscript(safe index: Index) -> Element? {

        return indices.contains(index) ? self[index] : nil
    }
}
