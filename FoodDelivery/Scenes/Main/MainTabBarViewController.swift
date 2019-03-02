//
//  MainTabBarViewController.swift
//  FoodDelivery
//
//  Created by Myhovych on 2/21/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    var presenter: MainPresenter!
    
    private let mainVC = MainViewController()
    private let cartVC = CartViewController()
    private let profileVC = ProfileViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [setupController(vc: mainVC,    image: "menu",    title: "Menu"),
                           setupController(vc: cartVC,    image: "cart",    title: "Cart"),
                           setupController(vc: profileVC, image: "profile", title: "Profile")]
    }
    
    func setupController(vc: UIViewController, image: String, title: String) -> UINavigationController {
        
        let recentVC = UINavigationController(rootViewController: vc)
        recentVC.tabBarItem.image = UIImage(named: image)
        recentVC.tabBarItem.title = title
        
        return recentVC
    }
}
