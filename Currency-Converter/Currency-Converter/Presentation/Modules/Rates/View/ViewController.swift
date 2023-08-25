//
//  ViewController.swift
//  Currency-Converter
//
//  Created by Mauricio Tapia on 25/08/23.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var CADLabel: UILabel!
    
    @IBOutlet weak var CHFLabel: UILabel!
    
    @IBOutlet weak var GBPLabel: UILabel!
    
    @IBOutlet weak var JPYLabel: UILabel!
    
    @IBOutlet weak var USDLabel: UILabel!
    
    @IBOutlet weak var TRYLabel: UILabel!
    
    var viewModel: ViewModel!
    var input: ViewModelInput!
    
    private var subscriptions = Set<AnyCancellable>()
    private var item: Currency! {
        didSet {
            CADLabel.text = item.getValue(rate: .cad)
            CHFLabel.text = item.getValue(rate: .chf)
            GBPLabel.text = item.getValue(rate: .gbp)
            JPYLabel.text = item.getValue(rate: .jpy)
            USDLabel.text = item.getValue(rate: .usd)
            TRYLabel.text = item.getValue(rate: .try_)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // This could be in the Builder and use it on Coordinator pattern
        let repository = CurrencyService()
        let useCase: GetLatestRateUseCaseProtocol = GetLatestRateUseCase(repository: repository)
        let output = ViewModelOutput()
        let input = ViewModelInput()
        let viewModel = ViewModel(useCase: useCase, output: output)
        self.viewModel = viewModel
        self.input = input
        bind()
    }

    @IBAction func getRatesClicked(_ sender: UIButton) {
        input.onRatesClickedPublisher.send()
    }
    
    func bind() {
        let output = self.viewModel.bind(input: input)
        output
            .item
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case let .failure(error) = completion {
                    self.show(error: error)
                }
            } receiveValue: { item in
                self.item = item
            }
            .store(in: &subscriptions)
    }
}

