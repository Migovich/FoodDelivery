//
//  MainTabBarViewController.swift
//  FoodDelivery
//
//  Created by Myhovych on 2/21/19.
//  Copyright © 2019 Artem Migovich. All rights reserved. 
//

import UIKit

class MainTabBarViewController: UITabBarController {

    private let mainVC = MenuTableViewController()
    private let cartVC = CartTableViewController()
    private let profileVC = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [setupController(viewController: mainVC, image: "menu", title: "Menu"),
                           setupController(viewController: cartVC, image: "cart", title: "Cart"),
                           setupController(viewController: profileVC, image: "profile", title: "Profile")]
    }
    
    func setupController(viewController: UIViewController, image: String, title: String) -> UINavigationController {
        let recentVC = UINavigationController(rootViewController: viewController)
        recentVC.tabBarItem.image = UIImage(named: image)
        recentVC.tabBarItem.title = title
        return recentVC
    }
}
