//
//  UserWalletsView.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/18/24.
//

import SwiftUI
import ElementaryUI

struct UserWalletsView: View {
    let wallets: [WalletBalance]
    let action: (WalletAction) -> Void
    private var multipleWallets: Bool {
        return wallets.count > 1
    }
    var body: some View {
        if !multipleWallets, let wallet = wallets.first {
            WalletView(wallet: wallet, action: action)
                .padding(.horizontal, 16)
        }else {
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(wallets) { wallet in
                        WalletView(wallet: wallet, action: action)
                            .containerRelativeFrame(.horizontal, count: 24, span: 20, spacing: 12)
                    }.scrollTargetLayout()
                }.padding(.horizontal, 16)
            }.scrollIndicators(.hidden)
            .scrollTargetBehavior(.paging)
        }
    }
}

#Preview {
    UserWalletsView(wallets: WalletBalance.skeleton) { _ in
        
    }
}
