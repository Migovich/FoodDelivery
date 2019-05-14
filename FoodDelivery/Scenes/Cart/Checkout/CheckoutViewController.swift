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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var deliveryTypeSC: UISegmentedControl!
    @IBOutlet weak var cashTypeSC: UISegmentedControl!
    
    lazy var popUpWindow: CheckoutPopUpWindow = {
        let view = CheckoutPopUpWindow()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.delegate = self
        return view
    }()
    
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        view.addSubview(visualEffectView)
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        visualEffectView.alpha = 0
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        view.addSubview(popUpWindow)
        popUpWindow.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        popUpWindow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popUpWindow.heightAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        popUpWindow.widthAnchor.constraint(equalToConstant: view.frame.width - 32).isActive = true
        
        popUpWindow.showSuccessMessage = true
        
        popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        popUpWindow.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.alpha = 1
            self.popUpWindow.alpha = 1
            self.popUpWindow.transform = CGAffineTransform.identity
        }
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

extension CheckoutViewController: PopUpDelegate {
    func handleDismissal() {
        UIView.animate(withDuration: 0.5, animations: {
            self.visualEffectView.alpha = 0
            self.popUpWindow.alpha = 0
            self.popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { (_) in
            self.popUpWindow.removeFromSuperview()
        }
    }
}
