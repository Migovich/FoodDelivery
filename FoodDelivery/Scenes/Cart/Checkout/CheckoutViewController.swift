//
//  CheckoutViewController.swift
//  FoodDelivery
//
//  Created by Myhovych on 5/11/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var deliveryType: UISegmentedControl!
    @IBOutlet weak var paymentType: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        
    }
    
    func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Оформити замовлення"
        
        self.confirmButton.layer.cornerRadius = 15
        
        self.deliveryType.layer.cornerRadius = 15
        self.deliveryType.layer.borderColor = R.color.mainGreen()?.cgColor
        self.deliveryType.layer.borderWidth = 1.0
        self.deliveryType.layer.masksToBounds = true
        
        self.paymentType.layer.cornerRadius = 15
        self.paymentType.layer.borderColor = R.color.mainGreen()?.cgColor
        self.paymentType.layer.borderWidth = 1.0
        self.paymentType.layer.masksToBounds = true
    }
}
