//
//  PaymentMethod.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/16/24.
//

import Foundation

struct PaymentMethod: Equatable, Hashable {
    let number: String
    let name: String
    let image: String
    static let preview = PaymentMethod(number: "Ending in 1971", name: "Master Card", image: "MasterOn")
}

