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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        
    }
    
    func setup(tags: ArrayString) {
        self.label?.text = "\(tags.values)"
    }
    
}
