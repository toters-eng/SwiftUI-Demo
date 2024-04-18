//
//  SwiftUITestsApp.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/15/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftUITestsApp: App {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some Scene {
        WindowGroup {
            PaymentsView.Factory.make(loadingTime: 1)
        }
    }
}
