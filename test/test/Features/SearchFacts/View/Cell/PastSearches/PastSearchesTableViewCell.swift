//
//  PastSearchesTableViewCell.swift
//  test
//
//  Created by Aline Gomes on 14/05/21.
//

import UIKit

class PastSearchesTableViewCell: UITableViewCell {
    
    static let identifier = "pastSearches"
    
    @IBOutlet private weak var contentTableView: UITableView?
    @IBOutlet private weak var title: UILabel?
    
    private var content: ArrayString?
    
    weak var delegate: SearchFactsViewControllerProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.contentView.backgroundColor = .defaultWhite
    }
    
    func setupUI() {
        self.title?.textColor = .defaultBrown
        self.title?.font = .dynamicFont(style: .title2  , type: .courierNewBold, size: 22)
        
    }
    
    func setup(suggestions: ArrayString) {
        self.content = suggestions
    }
}

extension PastSearchesTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.content?.values.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = self.content?.values[indexPath.row]
        cell.textLabel?.font = .dynamicFont(type: .courierNew, size: 18)
        cell.imageView?.image = UIImage(systemName: "magnifyingglass")
        cell.imageView?.tintColor = .defaultOrange
        return cell
    }
}

extension PastSearchesTableViewCell: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let term = self.content?.values[indexPath.row] else { return }
        self.delegate?.search(term: term)
    }
}

