//
//  Router.swift
//  Currency-Converter
//
//  Created by Mauricio Tapia on 25/08/23.
//

import Foundation

public enum Router: Equatable {
    case latest

    var url: String { scheme + "://" + host + path }
    var scheme: String { API.scheme }
    var host: String { API.URL }
    var apiKey: String { API.apiKey }

    var path: String {
        switch self {
        case .latest:
            return "/latest"
        }
    }

    var parameters: [URLQueryItem]? {
        var parameters: [URLQueryItem] = []
        switch self {
        case .latest:
            let accessKey = URLQueryItem(name: "access_key", value: apiKey)
            let format = URLQueryItem(name: "format", value: "1")
            parameters.append(accessKey)
            parameters.append(format)
        }
        return parameters
    }

    var headers: [String: String] {
        return [
            "Connection": "keep-alive",
            "Accept": "*/*",
            "Accept-Encoding": "gzip, deflate, br",
        ]
    }

    var body: Data? {
        nil
    }
    

    var method: HTTPMethod {
        switch self {
        case .latest:
            return HTTPMethod.get
        }
    }

}
