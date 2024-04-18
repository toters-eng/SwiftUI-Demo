//
//  WalletView.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/18/24.
//

import SwiftUI
import ElementaryUI

struct WalletView: View {
    let wallet: WalletBalance
    let action: (WalletAction) -> Void
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("\(wallet.currency) Toters Cash Balance")
                            .font(.system(size: 14, weight: .semibold))
                        Button(action: {
                            
                        }) {
                            Image("Info")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 16)
                        }
                        Spacer()
                    }
                    Text(wallet.formattedAmount)
                        .font(.system(size: 20, weight: .semibold))
                }
                if let image = wallet.walletType.image {
                    Image(image)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .border(Palette.darkGray, lineWidth: 4, shape: .circle)
                }
            }
            Button(action: {
        
            }) {
                HStack(spacing: 4) {
                    Text("View history")
                        .font(.system(size: 12, weight: .semibold))
                    Image("NextArrow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 16)
                }
            }
            HStack(spacing: 8) {
                Button(action: {
                    action(.topUp(wallet))
                }) {
                    HStack(spacing: 4) {
                        Image("PlusIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 16)
                        Text("Top up")
                            .font(.system(size: 12, weight: .semibold))
                    }.foregroundStyle(.white)
                        .padding(.horizontal, 12)
                    .frame(height: 32)
                    .background(Palette.green)
                    .clipShape(.rect(cornerRadius: 12))
                }
                Button(action: {
                    action(.send(wallet))
                }) {
                    HStack(spacing: 4) {
                        Image("SendIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 16)
                        Text("Send")
                            .font(.system(size: 12, weight: .semibold))
                    }.foregroundStyle(.white)
                        .padding(.horizontal, 12)
                    .frame(height: 32)
                    .background(Palette.green)
                    .clipShape(.rect(cornerRadius: 12))
                }
            }.padding(.top, 8)
        }.padding(16)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 12))
        .shadow(color: .black.opacity(0.05), radius: 5)
    }
}

enum WalletAction {
    case topUp(WalletBalance), send(WalletBalance)
    var wallet: WalletBalance {
        switch self {
        case .topUp(let wallet), .send(let wallet):
            return wallet
        }
    }
}
