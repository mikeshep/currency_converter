//
//  HTTPClientTests.swift.swift
//  Currency-ConverterTests
//
//  Created by Mauricio Tapia on 25/08/23.
//

import XCTest
@testable import Currency_Converter

final class RouterTests: XCTestCase {

    func test_getCategoriesUSeCsae_fetchCategories() async throws {
        let sut = HTTPClientSpy()

        let data = try await sut.fetchSpy()

        XCTAssert(data.success == true)
    }
}
