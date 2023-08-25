//
//  CurrencyService.swift
//  Currency-Converter
//
//  Created by Mauricio Tapia on 25/08/23.
//

import Foundation

class CurrencyService: CurrencyRepository, HTTPClient {
    func fetchLatest() async throws -> Currency {
        return try await sendRequest(endpoint: .latest, responseModel: Currency.self)
    }
}
