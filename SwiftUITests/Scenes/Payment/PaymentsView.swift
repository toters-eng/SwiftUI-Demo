//
//  PaymentsView.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/17/24.
//

import SwiftUI
import ElementaryUI
import Combine

struct PaymentsView: View {
    @State var viewModel: PaymentsViewModel
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section {
                    UserWalletsView(wallets: viewModel.wallets) { action in
                        switch action {
                        case .topUp(let walletBalance):
                            path.append(walletBalance)
                        case .send:
                            break
                        }
                    }.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .skeletonLoadable()
                    Text("Payment Methods")
                        .font(.system(size: 14, weight: .semibold))
                        .listRowInsets(EdgeInsets(top: 25, leading: 16, bottom: 12, trailing: 16))
                    Button(action: {
                        
                    }) {
                        HStack {
                            Text("Add card")
                                .font(.system(size: 12))
                                .foregroundStyle(.black)
                            Spacer()
                            Image("AddCard")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 28)
                        }.padding(.horizontal, 16)
                        .padding(.vertical, 14)
                        .background(Color.white)
                        .clipShape(.rect(cornerRadius: 12))
                        .shadow(color: .black.opacity(0.05), radius: 5)
                    }
                }.listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                .listRowSeparator(.hidden)
                .buttonStyle(.borderless)
            }.listStyle(.grouped)
            .scrollBounceBehavior(.basedOnSize)
            .scrollContentBackground(.hidden)
            .background(Palette.background)
            .navigation(title: "Payments")
            .task {
                await viewModel.fetch()
            }.navigationDestination(for: WalletBalance.self) { wallet in
                TopUpView.Factory.make(wallet: wallet, paymentMethod: .preview, loadingTime: 1)
            }.skeleton(loading: viewModel.loading)
        }
    }
}

#Preview {
    PaymentsView.Factory.make()
}
