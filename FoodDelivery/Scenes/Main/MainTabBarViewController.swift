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
        viewControllers = [setupController(viewController: mainVC, title: "Меню", image: R.image.menu()!),
                           setupController(viewController: cartVC, title: "Кошик", image: R.image.cart()!),
                           setupController(viewController: profileVC, title: "Профіль", image: R.image.profile()!)]
        tabBar.tintColor = R.color.gray()
    }
    
    override func loadViewIfNeeded() {
        
    }
    
    func setupController(viewController: UIViewController, title: String, image: UIImage) -> UINavigationController {
        let recentVC = UINavigationController(rootViewController: viewController)
        recentVC.tabBarItem.image = image
        recentVC.tabBarItem.title = title
        return recentVC
    }
}
