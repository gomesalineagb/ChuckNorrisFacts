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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FactsTableViewCell.identifier, for: indexPath) as? FactsTableViewCell {
            cell.setup(model: ListFactsModel(fact: "Chuck norris is a terrible joker, as a joker he is a good actor", tag: "sarcasm"))
            
            return cell
        }
        
        return UITableViewCell()
    }
}
