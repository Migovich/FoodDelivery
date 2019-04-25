//
//  CartTableViewCell.swift
//  FoodDelivery
//
//  Created by Myhovych on 4/9/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var productImageView: UIImageView?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var pcsCountLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

extension CartTableViewCell: CartCellView {
    func display(imageURL: URL?) {
        productImageView?.image = R.image.turkey()
    }
    
    func display(title: String) {
        titleLabel.text = title
    }
    
    func display(price: String) {
        priceLabel.text = price
    }
    
    func display(pcs: String) {
        pcsCountLabel.text = pcs
    }
}
