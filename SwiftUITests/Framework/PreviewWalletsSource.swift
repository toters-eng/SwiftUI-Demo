//
//  PreviewWalletsSource.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/16/24.
//

import Foundation

struct PreviewWalletsSource: WalletsSource {
    var loadingTime: UInt64 = 0
    func fetch() async throws -> [WalletBalance] {
        try await Task.sleep(nanoseconds: loadingTime * 1_000_000_000)
        let wallets = [("USD", 1.0), ("LBP", 100000.0)]
        return wallets.map { wallet in
            let shouldShowError = Bool.random()
            let error = "LBP cards are not supported for USD top-up. You can top-up your LBP wallet instead."
            let amount = Double.random(in: 0..<100)
            return WalletBalance(amount: amount * wallet.1, currency: wallet.0, error: shouldShowError ? error: nil, switchEnabled: shouldShowError)
        }
    }
}
