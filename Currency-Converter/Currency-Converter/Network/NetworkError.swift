//
//  NetworkError.swift
//  Currency-Converter
//
//  Created by Mauricio Tapia on 25/08/23.
//

import Foundation

enum NetworkError: Error {
    case failLoadJSON
    case decode
    case invalidURL
    case noResponse
    case unauthorised
    case offline
    case unknown
}
