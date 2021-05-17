//
//  SearchFactsViewController.swift
//  test
//
//  Created by Aline Gomes on 13/05/21.
//

import UIKit

class SearchFactsViewController: UIViewController, ActivityIndicatorProtocol {
    
    var activityIndicator: UIActivityIndicatorView = {
        let act =  UIActivityIndicatorView(style: .large)
        act.color = .defaultBlue
        return act
    }()
    
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
        setupActivityIndicator()
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
    }
}

extension SearchFactsViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let text = searchBar.text, text.count >= 3 && text.count <= 120 else {
            
            let alert = UIAlertController(title: title, message: "Enter at least 3 character", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { a in
                
                searchBar.resignFirstResponder()
            }))
            self.present(alert, animated: true, completion: nil)
            return
        }
            
        startActivityIndicator()
        self.viewModel?.search(with: text)
    }
}

extension SearchFactsViewController: SearchFactsViewControllerProtocol {
    func search(category: String) {
        startActivityIndicator()
        self.viewModel?.fetchByCategory(category: category)
    }
    
    func search(term: String) {
        startActivityIndicator()
        self.viewModel?.search(with: term)
    }
}
