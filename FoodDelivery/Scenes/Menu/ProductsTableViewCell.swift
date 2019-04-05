//
//  MainTableViewCell.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/5/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

class ProductsTableViewCell: UITableViewCell, ProductCellView, ReusableView, NibLoadableView {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func display(imageURL: URL) {
        productImageView.load(url: imageURL)
    }

    func display(title: String) {
        titleLabel.text = title
    }
    
    func display(subtitle: String) {
        subtitleLabel.text = subtitle
    }
    
    func display(price: String) {
        priceLabel.text = price
    }
}
