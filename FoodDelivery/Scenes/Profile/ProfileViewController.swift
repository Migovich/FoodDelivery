//
//  ProfileViewController.swift
//  FoodDelivery
//
//  Created by Myhovych on 2/21/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "pikachu")
        return iv
    }()
    
    lazy var usernameContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "user"), usernameTextField)
    }()
    
    lazy var phoneContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "phone"), phoneTextField)
    }()
    
    lazy var emailContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "email"), emailTextField)
    }()
    
    lazy var addressContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "address"), addressTextField)
    }()
    
    lazy var usernameTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "User name", isSecureTextEntry: false)
    }()
    
    lazy var phoneTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Phone number", isSecureTextEntry: false)
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Email", isSecureTextEntry: false)
    }()
    
    lazy var addressTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Address", isSecureTextEntry: false)
    }()

    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SAVE", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor.mainGreen(), for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
    }
    
    // MARK: - Selectors
    
    @objc func handleSave() {
    }
    
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    // MARK: - API
    
    // MARK: - Helper Functions
    
    func configureViewComponents() {
        view.backgroundColor = UIColor.mainGreen()
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 150)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(usernameContainerView)
        usernameContainerView.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(phoneContainerView)
        phoneContainerView.anchor(top: usernameContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(emailContainerView)
        emailContainerView.anchor(top: phoneContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(addressContainerView)
        addressContainerView.anchor(top: emailContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(saveButton)
        saveButton.anchor(top: addressContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
    }
}
