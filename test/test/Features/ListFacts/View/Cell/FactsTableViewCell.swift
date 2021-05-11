//
//  FactsTableViewCell.swift
//  test
//
//  Created by Aline Gomes on 11/05/21.
//

import UIKit

class FactsTableViewCell: UITableViewCell {
    static let identifier = "listFactsCell"

    @IBOutlet private weak var factLabel: UILabel?
    @IBOutlet private weak var tagLabel: UILabel?
    @IBOutlet private weak var shareButton: UIButton?


    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.factLabel?.font = .dynamicFont(type: .courierNew, size: 20)
        
        self.tagLabel?.layer.cornerRadius = 5
        self.tagLabel?.textColor = .white
        self.tagLabel?.layer.backgroundColor = UIColor.lightGray.cgColor
        self.tagLabel?.font = .dynamicFont(style: .body, type: .courierNewBold, size: 18)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(model: ListFactsModel) {
        self.factLabel?.text = model.fact
        self.tagLabel?.text = model.tag
    }
    
    @IBAction func shareWithFriends(_ sender: Any) {
    }
    
}
