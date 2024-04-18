//
//  FetchWalletsUseCase.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/16/24.
//

import Foundation

protocol FetchWalletsUseCase {
    func fetchWallets() async throws -> [WalletBalance]
}
