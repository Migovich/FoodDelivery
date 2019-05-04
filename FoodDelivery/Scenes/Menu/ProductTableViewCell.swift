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
    func increaseProductPcs(count: Int)
    func decreaseProductPcs(count: Int)
}

class ProductTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var pcsLabel: UILabel!
    @IBOutlet weak var pcsCounter: UIStackView!
    
    weak var delegate: ProductTableViewCellDelegate?
    var count = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = R.color.white()
        self.addToCartButton.backgroundColor = R.color.white()
        self.addToCartButton.setTitleColor(R.color.gray(), for: .normal)
        self.addToCartButton.layer.cornerRadius = 15
        self.pcsCounter.isHidden = true
    }
    
    @IBAction func addToCartButton(_ sender: Any) {
        delegate?.addToCartButtonTapped(self)
        self.count = 1
        pcsLabel.text = "\(count)"
        self.pcsCounter.isHidden = false
        self.addToCartButton.isHidden = true
    }
    
    @IBAction func increaseButton(_ sender: Any) {
        self.count += 1
        delegate?.increaseProductPcs(count: count)
        pcsLabel.text = "\(count)"
    }
    
    @IBAction func decreaseButton(_ sender: Any) {
        self.count -= 1
        delegate?.increaseProductPcs(count: count)
        pcsLabel.text = "\(count)"
        if count < 1 {
            self.pcsCounter.isHidden = true
            self.addToCartButton.isHidden = false
        }
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
