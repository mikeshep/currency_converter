//
//  GetLatestRateUseCase.swift
//  Currency-Converter
//
//  Created by Mauricio Tapia on 25/08/23.
//

import Foundation

protocol GetLatestRateUseCaseProtocol {
    func execute() async throws -> Currency
}

final class GetLatestRateUseCase: GetLatestRateUseCaseProtocol {

    typealias ResultValue = Currency

    private let repository: CurrencyRepository

    init(repository: CurrencyRepository) {
        self.repository = repository
    }

    func execute() async throws -> ResultValue {
        return try await repository.fetchLatest()
    }
}
