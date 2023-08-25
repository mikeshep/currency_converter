//
//  ViewModel.swift
//  Currency-Converter
//
//  Created by Mauricio Tapia on 25/08/23.
//

import Foundation
import Combine

struct ViewModelInput {
    let onRatesClickedPublisher = PassthroughSubject<Void, Never>()
}

struct ViewModelOutput {
    let item = PassthroughSubject<Currency, Error>()
}

class ViewModel {
    private let output: ViewModelOutput
    private var subscriptions = Set<AnyCancellable>()
    private let useCase: GetLatestRateUseCaseProtocol
    
    init(useCase: GetLatestRateUseCaseProtocol, output: ViewModelOutput) {
        self.output = output
        self.useCase = useCase
    }
    
    func bind(input: ViewModelInput) -> ViewModelOutput {
        input.onRatesClickedPublisher
            .sink(receiveValue: fetch)
            .store(in: &subscriptions)
        
        return output
    }
    
    func fetch() {
        Task {
            do {
                let recipe = try await self.useCase.execute()
                self.output.item.send(recipe)
            } catch {
                self.output.item.send(completion: .failure(error))
            }
        }
    }
}
