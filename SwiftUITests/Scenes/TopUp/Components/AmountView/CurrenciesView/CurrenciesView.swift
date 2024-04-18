//
//  CurrenciesView.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/16/24.
//

import SwiftUI

struct CurrenciesView: View {
    @Binding var amount: Double?
    @Binding var currency: String
    let style: Style
    var body: some View {
        switch style {
        case .fixed(let currency):
            CurrencyTextField("Enter an Amount", amount: $amount, currency: currency)
        case .exchangeable(let exchange):
            DoubleCurrencyTextFields(amount: $amount, currency: $currency, exchange: exchange)
        }
    }
}

extension CurrenciesView {
    enum Style {
        case fixed(String)
        case exchangeable(CurrencyExchange)
    }
}

fileprivate struct CurrenciesViewPreview: View {
    @State private var amount: Double? = 122
    var body: some View {
        VStack(spacing: 50) {
            CurrenciesView(amount: $amount, currency: .constant("USD"), style: .fixed("USD"))
            Divider()
            CurrenciesView(amount: $amount, currency: .constant("USD"), style: .exchangeable(.preview))
        }.padding()
    }
}
#Preview {
    CurrenciesViewPreview()
}
