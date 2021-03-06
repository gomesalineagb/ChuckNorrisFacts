//
//  SearchFactsCoordinator.swift
//  test
//
//  Created by Aline Gomes on 13/05/21.
//

import Foundation
import UIKit

class SearchFactsCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(with nav: UINavigationController) {
        self.navigationController = nav
    }
    
    func start() {
//        navigationController.navigationBar.prefersLargeTitles = false
        navigationController.navigationBar.tintColor = .defaultOrange
        
        let chuckNorrisProvider = ChuckNorrisDataManager()
        let searchFactsView = SearchFactsViewController()
        let cacheProvider = CacheDataManager()
        let viewModel = SearchFactsViewModel(cache: cacheProvider)
        
        searchFactsView.viewModel = viewModel
        viewModel.chuckNorrisProvider = chuckNorrisProvider
        viewModel.coordinator = self
                
        navigationController.pushViewController(searchFactsView, animated: true)
    }
}

extension SearchFactsCoordinator: SearchFactsCoordinatorProtocol {
    func gotoListFactsScreen() {
        let coordinator = ListFactsCoordinator(with: navigationController)
        
        coordinator.start()
    }
}
