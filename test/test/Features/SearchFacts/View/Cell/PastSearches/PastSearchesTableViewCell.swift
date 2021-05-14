//
//  PastSearchesTableViewCell.swift
//  test
//
//  Created by Aline Gomes on 14/05/21.
//

import UIKit

class PastSearchesTableViewCell: UITableViewCell {
    
    static let identifier = "pastSearches"
    
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
    
    func setup(suggestions: ArrayString) {
        self.label?.text = "\(suggestions.values)"
    }
}
