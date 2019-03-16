//
//  ProductsSectionHFV.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/15/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

protocol ExpandableHFVDelegate {
    func toggleSection(header: ProductsSectionHFV, section: Int)
}

class ProductsSectionHFV: UITableViewHeaderFooterView, ReusableView {
    var delegate: ExpandableHFVDelegate?
    var section: Int!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func selectHeaderAction(gestureRecognizer: UITapGestureRecognizer) {
        let cell = gestureRecognizer.view as! ProductsSectionHFV
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    func customInit(title: String, section: Int, delegate: ExpandableHFVDelegate) {
        self.textLabel?.text = title
        self.section = section
        self.delegate = delegate
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel?.textColor = UIColor.white
        self.contentView.backgroundColor = UIColor.darkGray
    }
}
