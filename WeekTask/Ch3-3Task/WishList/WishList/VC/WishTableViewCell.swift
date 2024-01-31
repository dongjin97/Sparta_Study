//
//  WishTableViewCell.swift
//  WishList
//
//  Created by 원동진 on 2024/01/05.
//

import UIKit

class WishTableViewCell: UITableViewCell {

    @IBOutlet weak var wishProductLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        wishProductLabel.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setProduct(model : Product){
        wishProductLabel.text = "\(model.id) \(model.title ?? "") - \(model.price)$"
    }
}
