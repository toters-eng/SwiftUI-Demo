//
//  AmountsGridView.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/16/24.
//

import SwiftUI
import ElementaryUI

struct AmountsGridView: View {
    private let columns = Array(repeating: GridItem(spacing: 6), count: 3)
    @Binding var selectedValue: SuggestedValues.Amount?
    let values: [SuggestedValues.Amount]
    let currency: String
    var body: some View {
        LazyVGrid(columns: columns, spacing: 6) {
            ForEach(values) { value in
                let selected = selectedValue?.id == value.id
                Button(action: {
                    withAnimation(.easeInOut) {
                        selectedValue = selected ? nil: value
                    }
                }) {
                    Text(value.formatted(currency: currency))
                        .foregroundStyle(.black)
                        .font(.system(size: 10, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(Palette.lightGray)
                        .border(Palette.green, lineWidth: selected ? 1: 0, shape: .rect(cornerRadius: 12))
                }
            }
        }
    }
}
