//
//  UseCase.swift
//  Currency-Converter
//
//  Created by Mauricio Tapia on 25/08/23.
//

import Foundation

protocol UseCase {
    associatedtype Dependency
    var dependencies: [Dependency] { get }
}
