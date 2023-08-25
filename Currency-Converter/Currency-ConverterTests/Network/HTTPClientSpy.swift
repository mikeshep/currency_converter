//
//  HTTPClientSpy.swift
//  Currency-ConverterTests
//
//  Created by Mauricio Tapia on 25/08/23.
//

import Foundation
import Currency_Converter

class HTTPClientSpy: HTTPClient {
    func fetchSpy() async throws -> ResponseSpy {
        return try await sendRequest(endpoint: .latest, responseModel: ResponseSpy.self)
    }
}

// MARK: - ResponseSpy
struct ResponseSpy: Codable {
    let success: Bool
    let timestamp: Int
    let base, date: String
    let rates: [String: Double]
}
