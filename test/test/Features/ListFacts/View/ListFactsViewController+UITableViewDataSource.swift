//
//  ListFactsViewController+UITableViewDataSource.swift
//  test
//
//  Created by Aline Gomes on 11/05/21.
//

import Foundation
import UIKit

extension ListFactsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FactsTableViewCell.identifier, for: indexPath) as? FactsTableViewCell {
            guard let viewModel = viewModel else { return UITableViewCell() }
            cell.setup(model: viewModel.getFact(for: indexPath))
            
            return cell
        }
        
        return UITableViewCell()
    }
}
