//
//  BalanceView.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/15/24.
//

import SwiftUI
import ElementaryUI

struct BalanceView: View {
    let wallet: WalletBalance
    var body: some View {
        HStack(spacing: 10) {
            HStack(spacing: 6) {
                if let imageName = wallet.walletType.image {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24)
                        .clipShape(.circle)
                }
                (Text("Balance: ") +
                 Text(wallet.formattedAmount)
                    .fontWeight(.semibold)
                )
                    .font(.system(size: 12))
            }.padding(.vertical, 2)
            Spacer()
            Button(action: {
                
            }) {
                Text("Switch")
                    .foregroundStyle(Palette.green)
                    .font(.system(size: 12, weight: .semibold))
                    .padding(.horizontal, 16)
                    .frame(height: 28)
                    .border(Palette.green, lineWidth: 1, shape: .rect(cornerRadius: 8))
            }.hidden(!wallet.switchEnabled)
        }.padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 12))
        .shadow(color: .black.opacity(0.05), radius: 5)
    }
}
