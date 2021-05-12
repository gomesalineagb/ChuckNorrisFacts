//
//  ListFactsViewController.swift
//  test
//
//  Created by Aline Gomes on 10/05/21.
//

import UIKit

class ListFactsViewController: UIViewController {
    
    private lazy var tableViewContent: UITableView = {
        let table = UITableView(frame: self.view.frame)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = UITableView.automaticDimension
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
    }

    func isFirstAcess() {
        
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
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
    }
}


extension ListFactsViewController: ListFactsViewControllerProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableViewContent.reloadData()
            //stop indicator
        }
    }
}
