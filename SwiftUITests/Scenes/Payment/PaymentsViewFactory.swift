//
//  PaymentsViewFactory.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/18/24.
//

import Foundation

extension PaymentsView {
    enum Factory {
        static func make(loadingTime: UInt64 = 0) -> PaymentsView {
            let viewModel = makeViewModel(loadingTime: loadingTime)
            return PaymentsView(viewModel: viewModel)
        }
        static func makeViewModel(loadingTime: UInt64 = 0) -> PaymentsViewModel {
            let walletsSource = PreviewWalletsSource(loadingTime: loadingTime)
            let repository = PaymentsRepository(walletsSource: walletsSource)
            return PaymentsViewModel(repository: repository)
        }
    }
}
