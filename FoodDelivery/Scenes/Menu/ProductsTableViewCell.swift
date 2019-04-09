//
//  MainTableViewCell.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/5/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit
import Kingfisher

class ProductsTableViewCell: UITableViewCell, ProductCellView, ReusableView, NibLoadableView {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var pcsCountView: UIView!
    @IBOutlet weak var addToCartButton: UIButton!
    
    @IBAction func addToCartButton(_ sender: Any) {
        
    }
    
    func display(imageURL: URL) {
        productImageView.kf.setImage(with: imageURL)
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
