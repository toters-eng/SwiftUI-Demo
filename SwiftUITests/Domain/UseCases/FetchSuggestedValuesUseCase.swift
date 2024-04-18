//
//  FetchSuggestedValuesUseCase.swift
//  SwiftUITests
//
//  Created by Joe Maghzal on 4/16/24.
//

import Foundation

protocol FetchSuggestedValuesUseCase {
    func fetchValues(for currency: String) async throws -> SuggestedValues
}
