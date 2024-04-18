//
//  PaymentMethodView.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/15/24.
//

import SwiftUI
import ElementaryUI

struct PaymentMethodView: View {
    let paymentMethod: PaymentMethod
    let error: String?
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 3) {
                Text("Payment Method")
                    .font(.system(size: 12, weight: .semibold))
                    .padding(.top, 3)
                Spacer()
                Button(action: {
                    
                }) {
                    Text("Change")
                        .foregroundStyle(Palette.green)
                        .font(.system(size: 12, weight: .semibold))
                        .padding(.horizontal, 16)
                        .frame(height: 28)
                        .border(Palette.green, lineWidth: 1, shape: .rect(cornerRadius: 8))
                }
            }
            HStack(spacing: 8) {
                Image(paymentMethod.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 32)
                VStack(alignment: .leading) {
                    Text(paymentMethod.name)
                    Text(paymentMethod.number)
                        .foregroundStyle(Palette.gray)
                }.font(.system(size: 12))
                Spacer()
            }.padding(.top, 7)
            if let error = error {
                Text(error)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Palette.red)
                    .font(.system(size: 10))
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(Palette.red.opacity(0.1))
                    .clipShape(.rect(cornerRadius: 12))
                    .padding(.top, 12)
            }
        }.padding(16)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 12))
        .shadow(color: .black.opacity(0.05), radius: 5)
    }
}
