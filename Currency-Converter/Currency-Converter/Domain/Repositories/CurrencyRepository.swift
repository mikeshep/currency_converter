//
//  CurrencyRepository.swift
//  Currency-Converter
//
//  Created by Mauricio Tapia on 25/08/23.
//

import Foundation

protocol CurrencyRepository {
    func fetchLatest() async throws -> Currency
}
