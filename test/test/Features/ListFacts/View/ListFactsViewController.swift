//
//  ListFactsViewController.swift
//  test
//
//  Created by Aline Gomes on 10/05/21.
//

import UIKit

class ListFactsViewController: UIViewController, ActivityIndicatorProtocol {
    
    var activityIndicator: UIActivityIndicatorView = {
        let act =  UIActivityIndicatorView(style: .large)
        act.color = .defaultBlue
        return act
    }()
    
    private lazy var tableViewContent: UITableView = {
        let table = UITableView(frame: self.view.frame)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = UITableView.automaticDimension
        table.separatorStyle = .none
        table.estimatedRowHeight = 600
        table.backgroundColor = .defaultWhite
        table.register(UINib(nibName: "FactsTableViewCell", bundle: nil), forCellReuseIdentifier: FactsTableViewCell.identifier)
        table.dataSource = self
        table.delegate = self
        
        return table
    }()
    
    var viewModel: ListFactsViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupActivityIndicator()
    }
    
    @objc func refreshRandom() {
        startActivityIndicator()
        self.viewModel?.fetchRandom()
    }
    
    @objc func search() {
        self.viewModel?.search()
    }
}

extension ListFactsViewController: ViewCode {
    
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
        self.title = Constants.kTitleViewListFacts
        self.view.backgroundColor = .defaultWhite
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "04b30", size: 25)!, NSAttributedString.Key.foregroundColor: UIColor.defaultOrange]
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.defaultBrown]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: #selector(search))
        navigationItem.rightBarButtonItem?.tintColor = .defaultOrange
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .done, target: self, action: #selector(refreshRandom))
        navigationItem.leftBarButtonItem?.tintColor = .defaultOrange
        
    }
}


extension ListFactsViewController: ListFactsViewControllerProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableViewContent.reloadData()
        }
        stopActivityIndicator()
    }
}


extension ListFactsViewController: ShareFactWithFriendsProtocol {
    func share(fact: FactModel) {
        let activityViewController = UIActivityViewController(activityItems: [fact.url], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
}
