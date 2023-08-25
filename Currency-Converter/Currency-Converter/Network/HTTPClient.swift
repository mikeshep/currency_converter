//
//  HTTPClient.swift
//  Currency-Converter
//
//  Created by Mauricio Tapia on 25/08/23.
//

import Foundation

public protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Router, responseModel: T.Type) async throws -> T
}

/// Usage let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
public extension HTTPClient {
    func sendRequest<T: Decodable>(
        endpoint: Router,
        responseModel: T.Type
    ) async throws -> T {

        var request = URLComponents(string: endpoint.url)!

        if let parameters = endpoint.parameters {
            request.queryItems = parameters
        }

        guard let url = request.url else { throw NetworkError.invalidURL }

        var urlRequest = URLRequest(url: url)
        for header in endpoint.headers {
            urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
        }
        urlRequest.httpBody = endpoint.body
        
        urlRequest.httpMethod = endpoint.method.rawValue

        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest, delegate: nil)
            if let json = String(data: data, encoding: .utf8) {
                debugPrint("JSON: \(json)")
            }
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.noResponse
            }
            switch response.statusCode {
            case 200...299:
                let decodedResponse = try JSONDecoder().decode(responseModel, from: data)
                return decodedResponse
            case 401:
                throw NetworkError.unauthorised
            default:
                throw NetworkError.unknown
            }
        } catch URLError.Code.notConnectedToInternet {
            throw NetworkError.offline
        } catch let error where error is DecodingError {
            throw NetworkError.decode
        }
    }
}
