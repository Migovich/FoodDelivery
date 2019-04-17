//
//  MainTableViewCell.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/5/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit
import Kingfisher

protocol ProductTableViewCellDelegate: class {
    func addToCartButtonTapped(_ sender: ProductTableViewCell)
}

class ProductTableViewCell: UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    
    weak var delegate: ProductTableViewCellDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = R.color.white()
        self.addToCartButton.backgroundColor = R.color.white()
        self.addToCartButton.setTitleColor(R.color.gray(), for: .normal)
        self.addToCartButton.layer.cornerRadius = 15
    }
    
    @IBAction func addToCartButton(_ sender: Any) {
        delegate?.addToCartButtonTapped(self)
    }
}

extension ProductTableViewCell: ProductCellView {
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
