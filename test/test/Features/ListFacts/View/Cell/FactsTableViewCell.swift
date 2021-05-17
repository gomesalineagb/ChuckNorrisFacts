//
//  FactsTableViewCell.swift
//  test
//
//  Created by Aline Gomes on 11/05/21.
//

import UIKit

class FactsTableViewCell: UITableViewCell {
    static let identifier = "listFactsCell"
    
    weak var delegate: ShareFactWithFriendsProtocol?

    @IBOutlet private weak var factLabel: UILabel?
    @IBOutlet private weak var tagLabel: UILabel?
    @IBOutlet private weak var shareButton: UIButton?

    private var content: FactModel? {
        didSet {
            guard let cont = self.content else { return }
            self.factLabel?.text = cont.fact
            self.tagLabel?.text = cont.tag
            self.factLabel?.font = .dynamicFont(type: .courierNew, size: cont.fontSize)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.contentView.backgroundColor = .defaultWhite
    }
    
    func setupUI() {
        
        self.tagLabel?.layer.cornerRadius = 5
        self.tagLabel?.textColor = .defaultWhite
        self.tagLabel?.layer.backgroundColor = UIColor.defaultBlue.cgColor
        self.tagLabel?.font = .dynamicFont(style: .body, type: .courierNewBold, size: 18)
    }
    
    func setup(model: FactModel) {
        self.content = model
    }
    
    @IBAction func shareWithFriends(_ sender: Any) {
        guard let cont = self.content else { return }
        self.delegate?.share(fact: cont) 
    }
    
}
