//
//  SearchFactsViewController+UITableViewDataSource.swift
//  test
//
//  Created by Aline Gomes on 14/05/21.
//

import Foundation
import UIKit

extension SearchFactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        return UITableViewCell()
    }
}
