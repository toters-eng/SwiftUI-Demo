//
//  DoubleCurrencyTextFields.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/16/24.
//

import SwiftUI

struct DoubleCurrencyTextFields: View {
    @Binding var amount: Double?
    @Binding var currency: String
    let exchange: CurrencyExchange
    
    @State private var switched = false
    private var exchangedAmount: Double? {
        let exchangeRate = exchange.exchangeRate
        let rateToUse = switched ? exchangeRate: 1/exchangeRate
        return amount.map({$0 * rateToUse})
    }
    
    var body: some View {
        VStack(spacing: 10) {
            VStack(spacing: 8) {
                CurrencyTextField("Enter an Amount", amount: $amount, currency: fieldCurrency(originial: true))
                CurrencyTextField("Conversion", amount: .constant(exchangedAmount), currency: fieldCurrency(originial: false), borderStyle: Color.clear)
                    .background(Palette.darkGray)
                    .clipShape(.rect(cornerRadius: 12))
                    .disabled(true)
            }.overlay(switchButton)
            HStack(spacing: 4) {
                Text("Exchange rate: \(exchange.exchangeRateInfo)")
                    .font(.system(size: 10))
                    .foregroundStyle(Palette.gray)
                Button(action: {
                    
                }) {
                    Image("Info")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 20)
                }
                Spacer()
            }.padding(.top, 2)
        }.animation(.easeInOut, value: switched)
    }
    private var switchButton: some View {
        Button(action: {
            switchCurrencies()
        }) {
            Image("Switch")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 13)
                .padding(6)
                .background(Palette.green)
                .clipShape(.circle)
                .rotationEffect(Angle(radians: switched ? .pi: .zero))
        }
    }
    
    private func fieldCurrency(originial: Bool) -> String {
        let shouldUseOriginalCurrency = switched != originial
        return shouldUseOriginalCurrency ? exchange.originalCurrency: exchange.exchangeCurrency
    }
    private func switchCurrencies() {
        let oldExchangedAmount = exchangedAmount
        switched.toggle()
        currency = fieldCurrency(originial: true)
        amount = oldExchangedAmount
    }
}

struct CurrencyExchange {
    let originalCurrency: String
    let exchangeCurrency: String
    let exchangeRate: Double
    var exchangeRateInfo: String {
        let originalValue = 1.formatted(.currency(code: originalCurrency))
        let exchangeValue = exchangeRate.formatted(.currency(code: exchangeCurrency))
        return "\(originalValue) = \(exchangeValue)"
    }
    static let preview = CurrencyExchange(originalCurrency: "USD", exchangeCurrency: "LBP", exchangeRate: 100000)
}

#Preview {
    DoubleCurrencyTextFields(amount: .constant(1222), currency: .constant("USD"), exchange: .preview)
        .padding()
}
