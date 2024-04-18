//
//  TopUpRepository.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/16/24.
//

import Foundation

protocol SuggestedValuesSource {
    func fetch(for currency: String) async throws -> SuggestedValues
}

struct TopUpRepository {
    let suggestedValuesSource: SuggestedValuesSource
}

//MARK: - FetchSuggestedValuesUseCase
extension TopUpRepository: FetchSuggestedValuesUseCase {
    func fetchValues(for currency: String) async throws -> SuggestedValues {
        return try await suggestedValuesSource.fetch(for: currency)
    }
}
