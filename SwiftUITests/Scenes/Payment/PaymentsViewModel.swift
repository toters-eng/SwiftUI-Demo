//
//  PaymentsViewModel.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/18/24.
//

import Foundation

@Observable
class PaymentsViewModel {
    typealias Repository = FetchWalletsUseCase
//MARK: - Properties
    let repository: Repository
    var loading = true
    var wallets = WalletBalance.skeleton
    
//MARK: - Initializer
    init(repository: Repository) {
        self.repository = repository
    }
    
//MARK: - Functions
    func fetch() async {
        do {
            self.wallets = try await repository.fetchWallets()
            loading = false
        }catch {
            loading = false
        }
    }
}
