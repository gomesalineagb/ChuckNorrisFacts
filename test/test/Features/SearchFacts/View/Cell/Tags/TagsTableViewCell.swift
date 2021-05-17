//
//  TagsTableViewCell.swift
//  test
//
//  Created by Aline Gomes on 14/05/21.
//

import UIKit

class TagsTableViewCell: UITableViewCell {
    
    static let identifier = "tagsCell"
    
    @IBOutlet private weak var title: UILabel?
    @IBOutlet private weak var contentCollection: UICollectionView?
    
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
        self.contentCollection?.translatesAutoresizingMaskIntoConstraints = false
        self.contentCollection?.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
    }
    
    func setup(tags: ArrayString) {
        self.content = tags
    }
}


extension TagsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.content?.values.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCell, let value = self.content?.values[indexPath.row] {
        
            cell.setup(value: value)
            
            return cell
        }
        return UICollectionViewCell()
    }
}



extension TagsTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let category = self.content?.values[indexPath.item] else { return }
        self.delegate?.search(category: category)
    }
}

extension TagsTableViewCell: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let category = self.content?.values[indexPath.item] else { return .zero}
        let attributes = [NSAttributedString.Key.font: UIFont.dynamicFont(type: .courierNewBold, size: 30)]
        return (category as NSString).size(withAttributes: attributes)
    }
}
