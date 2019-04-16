//
//  ProductsSectionHFV.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/15/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

protocol ExpandableHFVDelegate {
    func toggleSection(_ sender: CategoryHeaderFooterView)
}

class CategoryHeaderFooterView: UITableViewHeaderFooterView, ReusableView {
    
    var delegate: ExpandableHFVDelegate?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func selectHeaderAction(gestureRecognizer: UITapGestureRecognizer) {
        delegate?.toggleSection(self)
    }
}

extension CategoryHeaderFooterView: CategoryCellView {
    func display(title: String) {
        self.textLabel?.text = title
    }
    
    func configure(delegate: ExpandableHFVDelegate?) {
        self.delegate = delegate
    }
    
    func setupView() {
        self.textLabel?.textColor = .white
        self.contentView.backgroundColor = R.color.mainGreen()
    }
}
