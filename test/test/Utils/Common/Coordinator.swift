//
//  Coordinator.swift
//  test
//
//  Created by Aline Gomes on 13/05/21.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
