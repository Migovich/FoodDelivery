//
//  MainTabBarViewController.swift
//  FoodDelivery
//
//  Created by Myhovych on 2/21/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        
        let mainVC = UINavigationController(rootViewController: MainViewController())
        mainVC.tabBarItem.image = #imageLiteral(resourceName: "cutlery")
        mainVC.tabBarItem.title = "Menu"
        
        let cartVC = UINavigationController(rootViewController: CartViewController())
        cartVC.tabBarItem.image = #imageLiteral(resourceName: "shopping-bag")
        cartVC.tabBarItem.title = "Cart"
        
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        profileVC.tabBarItem.image = #imageLiteral(resourceName: "avatar")
        profileVC.tabBarItem.title = "Profile"
        
        viewControllers = [mainVC, cartVC, profileVC]
    }
}