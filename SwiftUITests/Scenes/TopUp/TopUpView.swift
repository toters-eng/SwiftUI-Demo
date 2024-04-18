//
//  TopUpView.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/15/24.
//

import SwiftUI
import ElementaryUI

struct TopUpView: View {
    @State private var viewModel: TopUpViewModel
    private let paymentMethod: PaymentMethod
    init(viewModel: TopUpViewModel, paymentMethod: PaymentMethod) {
        self.viewModel = viewModel
        self.paymentMethod = paymentMethod
    }
    private var termsAttributes: AttributedString {
        let text = "By adding funds, you agree to Toters Cash Terms & Conditions"
        let tappableText = "Terms & Conditions"
        
        var termsAttributedString = AttributedString(tappableText)
        termsAttributedString.foregroundColor = Palette.green.color
        
        var attributedString = AttributedString(text)
        let tappableRange = attributedString.range(of: tappableText)!
        attributedString.replaceSubrange(tappableRange, with: termsAttributedString)
        return attributedString
    }
    var body: some View {
        List {
            Section {
                BalanceView(wallet: viewModel.wallet)
                PaymentMethodView(paymentMethod: paymentMethod, error: viewModel.wallet.error)
                AmountView(amount: $viewModel.amount, currency: $viewModel.currency, values: viewModel.suggestedAmounts, exchange: viewModel.exchangeStyle)
            }.listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
            .listRowSeparator(.hidden)
            .buttonStyle(.borderless)
            .skeletonLoading()
        }.listStyle(.grouped)
        .scrollBounceBehavior(.basedOnSize)
        .scrollContentBackground(.hidden)
        .background(Palette.background)
        .overlay(alignment: .bottom) {
            VStack(spacing: 10) {
                Text(termsAttributes)
                    .font(.system(size: 10))
                    .foregroundStyle(Palette.gray)
                Button(action: {
                    
                }) {
                    Text("Top up")
                        .foregroundStyle(.white)
                        .font(.system(size: 14, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(viewModel.topUpButtoEnabled ? Palette.green: Palette.disabled)
                        .clipShape(.rect(cornerRadius: 12))
                }.disabled(!viewModel.topUpButtoEnabled)
            }.padding(16)
        }.task {
            await viewModel.fetch()
        }.skeleton(loading: viewModel.loading, disabled: true)
            .navigation(title: "Top up")
    }
}

#Preview {
    TopUpView.Factory.make(wallet: .skeletonItem, paymentMethod: .preview)
}
