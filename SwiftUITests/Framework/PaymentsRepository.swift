//
//  PaymentsRepository.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/18/24.
//

import Foundation

protocol WalletsSource {
    func fetch() async throws -> [WalletBalance]
}

struct PaymentsRepository {
    let walletsSource: WalletsSource
}

//MARK: - FetchWalletBalanceUseCase
extension PaymentsRepository: FetchWalletsUseCase {
    func fetchWallets() async throws -> [WalletBalance] {
        return try await walletsSource.fetch()
    }
}
