//
//  CheckoutPopUpWindow.swift
//  FoodDelivery
//
//  Created by Myhovych on 5/14/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

protocol PopUpDelegate {
    func handleDismissal()
}

class CheckoutPopUpWindow: UIView {
    
    // MARK: - Properties
    
    var delegate: PopUpDelegate?
    
    var showSuccessMessage: Bool? {
        didSet {
            guard let success = showSuccessMessage else {return}
            
            if success {
                checkLabel.text = "✔︎"
                notificationLabel.text = "Замовлення успішно оформлене!"
                checkLabel.textColor = .green
            } else {
                checkLabel.text = "✖︎"
                notificationLabel.text = "Упс.. Помилка"
                checkLabel.textColor = .red
            }
        }
    }
    
    let checkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 96)
        label.textColor = R.color.mainGreen()
        label.text = "✔︎"
        return label
    }()
    
    let notificationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir", size: 24)
        label.text = "Ваше замовлення успішно оформлене!"
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment(.center)
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ок", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(R.color.darkWhite(), for: .normal)
        button.backgroundColor = R.color.mainGreen()
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = R.color.darkWhite()
        
        addSubview(checkLabel)
        checkLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -48).isActive = true
        checkLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(notificationLabel)
        notificationLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        notificationLabel.topAnchor.constraint(equalTo: checkLabel.bottomAnchor, constant: 0).isActive = true
        notificationLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        notificationLabel.rightAnchor.constraint(equalTo: leftAnchor, constant: -12).isActive = true
        
        addSubview(button)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        button.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
     }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleDismissal() {
        delegate?.handleDismissal()
    }
}
