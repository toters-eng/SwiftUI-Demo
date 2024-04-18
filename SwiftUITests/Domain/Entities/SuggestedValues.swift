//
//  SuggestedValues.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/16/24.
//

import Foundation

struct SuggestedValues: Hashable, Equatable {
    let currency: String
    let provider: Provider?
    let maxValue: Double?
    let minValue: Double?
    let amounts: [Amount]
}

extension SuggestedValues {
    struct Provider: Hashable, Equatable {
        let currency: String
        let exchangeRate: Double
    }
}

extension SuggestedValues {
    struct Amount: Identifiable, Hashable, Equatable {
        var id = UUID()
        let value: Double
        func with(exchangeRate: Double) -> Self {
            return Amount(id: id, value: value/exchangeRate)
        }
        func formatted(currency: String) -> String {
            return value.formatted(.currency(code: currency))
        }
    }
}

//MARK: - Preview
extension SuggestedValues {
    struct Preview {
        static let amounts = [
            Amount(value: 5),
            Amount(value: 10),
            Amount(value: 20),
            Amount(value: 50),
            Amount(value: 75),
            Amount(value: 100)
        ]
        static let provider = Provider(currency: "USD", exchangeRate: 100000)
        static let skeleton = SuggestedValues(currency: "LBP", provider: provider, maxValue: 1000, minValue: 100, amounts: amounts)
    }
}
