//
//  SearchFactsViewController.swift
//  test
//
//  Created by Aline Gomes on 13/05/21.
//

import UIKit

class SearchFactsViewController: UIViewController {
    
    private lazy var tableViewContent: UITableView = {
        let table = UITableView(frame: self.view.frame)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = UITableView.automaticDimension
        table.separatorStyle = .none
//        table.allowsSelection = false
        table.estimatedRowHeight = 600
        table.backgroundColor = .defaultWhite
        table.register(UINib(nibName: "FactsTableViewCell", bundle: nil), forCellReuseIdentifier: FactsTableViewCell.identifier)
        table.dataSource = self
        table.delegate = self 
        
        return table
    }()
    
    var viewModel: SearchFactsViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

}

extension SearchFactsViewController: ViewCode{
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.tableViewContent.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableViewContent.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableViewContent.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            self.tableViewContent.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func setupViewHierarchy() {
        self.view.addSubview(tableViewContent)
    }
    
    func setupAdditionalConfiguration() {
        self.title = Constants.kTitleViewSearchFacts
        self.view.backgroundColor = .defaultWhite
        
        self.navigationItem.searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController?.searchBar.largeContentTitle = "Enter your search term (at least 3 char)"
    }
}

extension SearchFactsViewController: SearchFactsViewControllerProtocol {
    
}
