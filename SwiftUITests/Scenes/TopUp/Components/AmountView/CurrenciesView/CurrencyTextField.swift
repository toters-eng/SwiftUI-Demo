//
//  CurrencyTextField.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/16/24.
//

import SwiftUI
import ElementaryUI

struct CurrencyTextField<S: ShapeStyle>: View {
    let placeholder: String
    @Binding var amount: Double?
    let currency: String
    let borderStyle: S
    init(_ placeholder: String, amount: Binding<Double?>, currency: String, borderStyle: S = Palette.border) {
        self.placeholder = placeholder
        self._amount = amount
        self.currency = currency
        self.borderStyle = borderStyle
    }
    var body: some View {
        HStack {
            Text(currency)
                .font(.system(size: 12))
                .foregroundStyle(Palette.gray)
            TextField("Enter Amount", value: $amount, format: .number)
                .multilineTextAlignment(.trailing)
                .font(.system(size: 14))
                .keyboardType(.numberPad)
        }.padding(16)
        .frame(height: 48)
        .border(borderStyle, lineWidth: 1, shape: .rect(cornerRadius: 12))
    }
}
