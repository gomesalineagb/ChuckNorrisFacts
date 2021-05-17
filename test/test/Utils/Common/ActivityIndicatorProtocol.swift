//
//  ActivityIndicatorProtocol.swift
//  test
//
//  Created by Aline Gomes on 17/05/21.
//

import Foundation
import UIKit

protocol ActivityIndicatorProtocol {
    var activityIndicator: UIActivityIndicatorView { get set }
    
    func setupActivityIndicator()
    func startActivityIndicator()
    func stopActivityIndicator()
}

extension ActivityIndicatorProtocol {
    
    func setupActivityIndicator() {
        guard let vc = self as? UIViewController else { return }
        activityIndicator.center = vc.view.center
        vc.view.addSubview(activityIndicator)
    }
    
    func startActivityIndicator() {
        DispatchQueue.main.async {
            guard let vc = self as? UIViewController else { return }
            vc.view.isUserInteractionEnabled = false
            self.activityIndicator.startAnimating()
        }
    }
    
    func stopActivityIndicator() {
        DispatchQueue.main.async {
            guard let vc = self as? UIViewController else { return }
            vc.view.isUserInteractionEnabled = true
            self.activityIndicator.stopAnimating()
        }
    }
}
