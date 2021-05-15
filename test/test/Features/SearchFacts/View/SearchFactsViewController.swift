//
//  SearchFactsViewController.swift
//  test
//
//  Created by Aline Gomes on 13/05/21.
//

import UIKit

class SearchFactsViewController: UIViewController {
    
    internal lazy var tableViewContent: UITableView = {
        let table = UITableView(frame: self.view.frame)
        table.translatesAutoresizingMaskIntoConstraints = false
//        table.separatorStyle = .none
//        table.allowsSelection = false
        table.estimatedRowHeight = 600
        table.backgroundColor = .defaultWhite
        table.register(UINib(nibName: "TagsTableViewCell", bundle: nil), forCellReuseIdentifier: TagsTableViewCell.identifier)
        table.register(UINib(nibName: "PastSearchesTableViewCell", bundle: nil), forCellReuseIdentifier: PastSearchesTableViewCell.identifier)
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
        
        let search = UISearchController(searchResultsController: nil)
//        search.searchResultsUpdater = self
        search.searchBar.delegate = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Enter your search term"
        
        self.navigationItem.searchController = search
        self.navigationItem.searchController?.searchBar.largeContentTitle = "Enter your search term (at least 3 char)"
    }
}

extension SearchFactsViewController: UISearchBarDelegate {
//    func updateSearchResults(for searchController: UISearchController) {
//        guard let text = searchController.searchBar.text else { return }
//        //at least 3 character
//    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if let text = searchBar.text {
            self.viewModel?.search(with: text)
        }
        
    }
}

extension SearchFactsViewController: SearchFactsViewControllerProtocol {
    func search(category: String) {
        self.viewModel?.fetchByCategory(category: category)
    }
    
    func search(term: String) {
        self.viewModel?.search(with: term)
    }
}
