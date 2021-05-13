//
//  ListFactsCoordinator.swift
//  test
//
//  Created by Aline Gomes on 13/05/21.
//

import Foundation
import UIKit

public class ListFactsCoordinator: Coordinator{
    
    var navigationController: UINavigationController
    
    init(with nav: UINavigationController) {
        self.navigationController = nav
    }
    
    func start() {
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "04b30", size: 25)!, NSAttributedString.Key.foregroundColor: UIColor.defaultOrange]
        
        let chuckNorrisProvider = ChuckNorrisDataManager()
        let listFactsView = ListFactsViewController()
        let viewModel = ListFactsViewModel()
        
        listFactsView.viewModel = viewModel
        viewModel.listFactsView = listFactsView
        viewModel.chuckNorrisProvider = chuckNorrisProvider
                
        navigationController.pushViewController(listFactsView, animated: true)
    }
}


extension ListFactsCoordinator: ListFactsCoordinatorProtocol{
    func gotoSearchScreen() {
        
    }
}
