//
//  TopUpViewModel.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/16/24.
//

import Foundation

@Observable
class TopUpViewModel {
    typealias Repository = FetchSuggestedValuesUseCase 
//MARK: - Properties
    let wallet: WalletBalance
    let repository: Repository
    var loading = true
    var amount: Double?
    var currency = ""
    var suggestedValues = SuggestedValues.Preview.skeleton
    var exchangeStyle: CurrenciesView.Style {
        return ExchangeStyleFactory.make(for: suggestedValues)
    }
    var topUpButtoEnabled: Bool {
        return amount != nil
    }
    var suggestedAmounts: [SuggestedValues.Amount] {
        let amounts = suggestedValues.amounts
        if let provider = suggestedValues.provider, currency == provider.currency {
            return amounts.map({$0.with(exchangeRate: provider.exchangeRate)})
        }
        return amounts
    }
    
//MARK: - Initializer
    init(wallet: WalletBalance, repository: Repository) {
        self.wallet = wallet
        self.repository = repository
    }
    
//MARK: - Functions
    func fetch() async {
        do {
            self.suggestedValues = try await repository.fetchValues(for: wallet.currency)
            self.currency = self.suggestedValues.currency
            loading = false
        }catch {
            loading = false
        }
    }
}
