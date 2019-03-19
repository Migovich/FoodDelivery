//
//  MainTableViewCell.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/5/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

class ProductsTableViewCell: UITableViewCell, ProductCellView, ReusableView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = R.color.cellText()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func display(title: String) {
        titleLabel.text = title
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = R.color.cellBackground()
        contentView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    }
    
    override func awakeFromNib() {
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
