//
//  Rate.swift
//  Currency-Converter
//
//  Created by Mauricio Tapia on 25/08/23.
//

import Foundation

enum Rate: String, Codable {
    case cad = "CAD"
    case chf = "CHF"
    case gbp = "GBP"
    case jpy = "JPY"
    case usd = "USD"
    case try_ = "TRY"
}

// MARK: - ResponseSpy
struct Currency: Codable {
    let success: Bool
    let timestamp: Int
    let base, date: String
    let rates: [String: Double]
}

extension Currency {
    func getValue(rate: Rate) -> String {
        guard let value = rates[rate.rawValue] else {
            return "Not value"
        }
        return "\(rate.rawValue): \(value)"
    }
}
