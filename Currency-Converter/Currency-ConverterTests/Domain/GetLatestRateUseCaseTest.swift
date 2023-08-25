//
//  GetLatestRateUseCaseTest.swift
//  Currency-ConverterTests
//
//  Created by Mauricio Tapia on 25/08/23.
//

import XCTest
@testable import Currency_Converter

final class GetLatestRateUseCaseTest: XCTestCase {
    func test_getCategoriesUSeCsae_fetchCategories() async throws {
        let repository = CurrencyServiceMock()
        let sut = GetLatestRateUseCase(repository: repository)

        XCTAssertFalse(repository.fetchLatestCalled)

        _ = try await sut.execute()

        XCTAssertTrue(repository.fetchLatestCalled)
    }
}

class CurrencyServiceMock: CurrencyRepository {
    
    var fetchLatestCalled = false
    
    func fetchLatest() async throws -> Currency {
        fetchLatestCalled = true
        return Currency(success: true,
                        timestamp: 0,
                        base: "",
                        date: "",
                        rates: [:])
    }
}
