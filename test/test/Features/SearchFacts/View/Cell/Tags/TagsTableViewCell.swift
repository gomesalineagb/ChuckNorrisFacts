//
//  TagsTableViewCell.swift
//  test
//
//  Created by Aline Gomes on 14/05/21.
//

import UIKit

class TagsTableViewCell: UITableViewCell {
    
    static let identifier = "tagsCell"
    
    @IBOutlet private weak var label: UILabel?
    
    weak var delegate: SearchFactsViewControllerProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        self.label?.text = ""
    }
    
    func setup(tags: ArrayString) {
        tags.values.forEach { (tag) in
            self.label?.text?.append(" - \(tag)")
        }
    }
}
