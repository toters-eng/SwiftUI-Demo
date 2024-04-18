//
//  NavigationViewModifier.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/17/24.
//

import SwiftUI

struct NavigationViewModifier: ViewModifier {
    @Environment(\.dismiss) private var dismiss
    let title: String
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss.callAsFunction()
                    }) {
                        Image("BackImage")
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                }
            }
    }
}

extension View {
    func navigation(title: String) -> some View {
        modifier(NavigationViewModifier(title: title))
    }
}
