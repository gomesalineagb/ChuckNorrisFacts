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
        let viewModel = SearchFactsViewModel()
        let cacheProvider = CacheDataManager()
        
//        searchFactsView.viewModel = viewModel
        viewModel.searchFactsView = searchFactsView
        viewModel.chuckNorrisProvider = chuckNorrisProvider
        viewModel.cacheProvider = cacheProvider
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
