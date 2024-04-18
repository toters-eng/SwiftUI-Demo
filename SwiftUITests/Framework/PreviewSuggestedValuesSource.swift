//
//  PreviewSuggestedValuesSource.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/16/24.
//

import Foundation

struct PreviewSuggestedValuesSource: SuggestedValuesSource {
    var loadingTime: UInt64 = 0
    func fetch(for currency: String) async throws -> SuggestedValues {
        try await Task.sleep(nanoseconds: loadingTime * 1_000_000_000)
        let maxValue = Double.random(in: 800..<1000)
        let minValue = Double.random(in: 10..<50)
        let isUSD = currency == "USD"
        let provider: SuggestedValues.Provider? = !isUSD ? SuggestedValues.Provider(currency: "USD", exchangeRate: 100000): nil
        
        var amounts = [
            SuggestedValues.Amount(value: 5),
            SuggestedValues.Amount(value: 10),
            SuggestedValues.Amount(value: 20),
            SuggestedValues.Amount(value: 50),
            SuggestedValues.Amount(value: 75),
            SuggestedValues.Amount(value: 100)
        ]
        if !isUSD {
            amounts = amounts.map { amount in
                return SuggestedValues.Amount(value: amount.value * (provider?.exchangeRate ?? 1))
            }
        }
        return SuggestedValues(currency: currency, provider: provider, maxValue: maxValue, minValue: minValue, amounts: amounts)
    }
}
