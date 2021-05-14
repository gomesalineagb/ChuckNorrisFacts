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
 
        let chuckNorrisProvider = ChuckNorrisDataManager()
        DispatchQueue.main.async {
            
            let listFactsView = ListFactsViewController()
        let cacheProvider = CacheDataManager()
        let viewModel = ListFactsViewModel(cache: cacheProvider)
        
        listFactsView.viewModel = viewModel
        viewModel.listFactsView = listFactsView
        viewModel.chuckNorrisProvider = chuckNorrisProvider
        viewModel.coordinator = self
            self.navigationController.pushViewController(listFactsView, animated: true)
    }
    }
}


extension ListFactsCoordinator: ListFactsCoordinatorProtocol{
    func gotoSearchScreen() {
        let coordinator = SearchFactsCoordinator(with: navigationController)
        coordinator.start()
    }
}
