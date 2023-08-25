//
//  Extensions+UIKit.swift
//  Currency-Converter
//
//  Created by Mauricio Tapia on 25/08/23.
//

import Foundation
import UIKit

extension UIViewController {
    func show(error: Error) {
        let alert = UIAlertController(title: "Error",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
