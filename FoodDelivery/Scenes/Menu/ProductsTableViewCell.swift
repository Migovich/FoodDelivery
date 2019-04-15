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
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var pcsCountLabel: UILabel!
    var counter: Int = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @IBAction func addToCartButton(_ sender: Any) {
        addToCartButton.isHidden = !addToCartButton.isHidden
        counter += 1
        pcsCountLabel.text = String(counter)
    }
    @IBAction func plusButton(_ sender: Any) {
        counter += 1
        pcsCountLabel.text = String(counter)
    }
    
    @IBAction func minusButton(_ sender: Any) {
        if counter <= 1 {
            addToCartButton.isHidden = !addToCartButton.isHidden
        }
        counter -= 1
        pcsCountLabel.text = String(counter)
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
