//
//  AmountView.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/15/24.
//

import SwiftUI
import ElementaryUI

struct AmountView: View {
    @State private var selectedValue: SuggestedValues.Amount?
    @Binding var amount: Double?
    @Binding var currency: String
    let values: [SuggestedValues.Amount]
    let exchange: CurrenciesView.Style
    var body: some View {
        VStack(spacing: 16) {
            Text("Payment Method")
                .font(.system(size: 12, weight: .semibold))
                .padding(.top, 3)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(spacing: 12) {
                AmountsGridView(selectedValue: $selectedValue, values: values, currency: currency)
                    .onChange(of: selectedValue) { _, newValue in
                        amount = newValue?.value
                    }
                CurrenciesView(amount: $amount, currency: $currency, style: exchange)
                    .onChange(of: amount) { _, newValue in
                        guard newValue != selectedValue?.value else {return}
                        selectedValue = nil
                    }
            }
        }.padding(16)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 12))
        .shadow(color: .black.opacity(0.05), radius: 5)
    }
}
