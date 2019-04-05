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
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = R.image.pikachu()
        return imageView
    }()
    
    lazy var usernameContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, R.image.user()!, usernameTextField)
    }()
    
    lazy var phoneContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, R.image.phone()!, phoneTextField)
    }()
    
    lazy var emailContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, R.image.email()!, emailTextField)
    }()
    
    lazy var addressContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, R.image.address()!, addressTextField)
    }()
    
    lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        return textField.textField(withPlaceolder: "User name", isSecureTextEntry: false)
    }()
    
    lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        return textField.textField(withPlaceolder: "Phone number", isSecureTextEntry: false)
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        return textField.textField(withPlaceolder: "Email", isSecureTextEntry: false)
    }()
    
    lazy var addressTextField: UITextField = {
        let textField = UITextField()
        return textField.textField(withPlaceolder: "Address", isSecureTextEntry: false)
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SAVE", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(R.color.buttonText(), for: .normal)
        button.backgroundColor = R.color.buttonBackground()
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
    
    // MARK: - API
    
    // MARK: - Helper Functions
    
    func configureViewComponents() {
        view.backgroundColor = R.color.mainGreen()
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 150)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(usernameContainerView)
        usernameContainerView.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor,
                                     bottom: nil, right: view.rightAnchor,
                                     paddingTop: 24, paddingLeft: 32,
                                     paddingBottom: 0, paddingRight: 32,
                                     width: 0, height: 50)

        view.addSubview(phoneContainerView)
        phoneContainerView.anchor(top: usernameContainerView.bottomAnchor, left: view.leftAnchor,
                                  bottom: nil, right: view.rightAnchor,
                                  paddingTop: 16, paddingLeft: 32,
                                  paddingBottom: 0, paddingRight: 32,
                                  width: 0, height: 50)

        view.addSubview(emailContainerView)
        emailContainerView.anchor(top: phoneContainerView.bottomAnchor, left: view.leftAnchor,
                                  bottom: nil, right: view.rightAnchor,
                                  paddingTop: 16, paddingLeft: 32,
                                  paddingBottom: 0, paddingRight: 32,
                                  width: 0, height: 50)

        view.addSubview(addressContainerView)
        addressContainerView.anchor(top: emailContainerView.bottomAnchor, left: view.leftAnchor,
                                    bottom: nil, right: view.rightAnchor,
                                    paddingTop: 16, paddingLeft: 32,
                                    paddingBottom: 0, paddingRight: 32,
                                    width: 0, height: 50)

        view.addSubview(saveButton)
        saveButton.anchor(top: addressContainerView.bottomAnchor, left: view.leftAnchor,
                          bottom: nil, right: view.rightAnchor,
                          paddingTop: 24, paddingLeft: 32,
                          paddingBottom: 0, paddingRight: 32,
                          width: 0, height: 50)
    }
}
