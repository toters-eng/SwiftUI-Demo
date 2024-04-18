//
//  TopUpViewFactory.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/17/24.
//

import Foundation

extension TopUpView {
    enum Factory {
        static func make(wallet: WalletBalance, paymentMethod: PaymentMethod, loadingTime: UInt64 = 0) -> TopUpView {
            let viewModel = makeViewModel(wallet: wallet, loadingTime: loadingTime)
            return TopUpView(viewModel: viewModel, paymentMethod: paymentMethod)
        }
        static func makeViewModel(wallet: WalletBalance, loadingTime: UInt64 = 0) -> TopUpViewModel {
            let suggestedValuesSource = PreviewSuggestedValuesSource(loadingTime: loadingTime)
            let repository = TopUpRepository(suggestedValuesSource: suggestedValuesSource)
            return TopUpViewModel(wallet: wallet, repository: repository)
        }
    }
}
