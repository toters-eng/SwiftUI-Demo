//
//  WalletBalance.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/16/24.
//

import Foundation

struct WalletBalance: Identifiable, Equatable, Hashable {
    let id = UUID()
    let amount: Double
    let currency: String
    let error: String?
    let switchEnabled: Bool
    var formattedAmount: String {
        return amount.formatted(.currency(code: currency))
    }
    var walletType: Wallet {
        return Wallet(rawValue: currency) ?? .lbp
    }
    static var skeletonItem: WalletBalance {
        return WalletBalance(amount: 100, currency: "USD", error: nil, switchEnabled: true)
    }
    static var skeleton: [WalletBalance] {
        return [.skeletonItem, .skeletonItem]
    }
}

enum Wallet: String {
    case lbp = "LBP"
    case usd = "USD"
    var image: String? {
        return "\(rawValue)Icon"
    }
    var currency: String {
        return rawValue
    }
}
