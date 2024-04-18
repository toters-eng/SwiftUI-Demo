//
//  ExchangeStyleFactory.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/17/24.
//

import Foundation

enum ExchangeStyleFactory {
    static func make(for values: SuggestedValues) -> CurrenciesView.Style {
        if let provider = values.provider {
            let exchange = CurrencyExchange(originalCurrency: values.currency, exchangeCurrency: provider.currency, exchangeRate: provider.exchangeRate)
            return .exchangeable(exchange)
        }
        return .fixed(values.currency)
    }
}
