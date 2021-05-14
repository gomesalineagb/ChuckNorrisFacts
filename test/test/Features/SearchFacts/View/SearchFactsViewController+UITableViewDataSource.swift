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
        
        if let dataProperty = self.viewModel?.getDataProperty(indexPath: indexPath) {
            
            switch dataProperty.type{
            case .tags:
                
                if let cell = tableView.dequeueReusableCell(withIdentifier: TagsTableViewCell.identifier, for: indexPath) as? TagsTableViewCell, let arrayString = dataProperty as? ArrayString {
                    cell.setup(tags: arrayString)
                    return cell
                }
                
            case .suggestions:
                
                if let cell = tableView.dequeueReusableCell(withIdentifier: PastSearchesTableViewCell.identifier, for: indexPath) as? PastSearchesTableViewCell, let arrayString = dataProperty as? ArrayString {
                    cell.setup(suggestions: arrayString)
                    return cell
                }
                
            }
        }
        
        return UITableViewCell()
    }
}
