//
//  TagCollectionViewCell.swift
//  test
//
//  Created by Aline Gomes on 15/05/21.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "tag"
    
    @IBOutlet private weak var tagLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        self.tagLabel?.layer.cornerRadius = 5
        self.tagLabel?.layer.backgroundColor = UIColor.defaultBlue.cgColor
        self.tagLabel?.font = .dynamicFont(type: .courierNewBold, size: 25)
    }
    
    func setup(value: String) {
        self.tagLabel?.text = value
    }

}
