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
        navigationController.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.defaultBrown]
        
 
        let chuckNorrisProvider = ChuckNorrisDataManager()
        let listFactsView = ListFactsViewController()
        let cacheProvider = CacheDataManager()
        let viewModel = ListFactsViewModel(cache: cacheProvider)
        
        listFactsView.viewModel = viewModel
        viewModel.listFactsView = listFactsView
        viewModel.chuckNorrisProvider = chuckNorrisProvider
//        viewModel.cacheProvider = cacheProvider
        viewModel.coordinator = self
        navigationController.pushViewController(listFactsView, animated: true)
    }
}


extension ListFactsCoordinator: ListFactsCoordinatorProtocol{
    func gotoSearchScreen() {
        let coordinator = SearchFactsCoordinator(with: navigationController)
        coordinator.start()
    }
}
