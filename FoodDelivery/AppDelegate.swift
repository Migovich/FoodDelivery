//
//  AppDelegate.swift
//  FoodDelivery
//
//  Created by Myhovych on 2/20/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //Загрузка завершилась
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = MainTabBarViewController()
        self.window?.makeKeyAndVisible()
        //print(#function)
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        //Собирается стать неактивным
        //print(#function)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        //Стало неактивным
        //print(#function)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        //Собирается вернутся на передний план
        //print(#function)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        //Стало активным
        //print(#function)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        //Завершило работу
        //print(#function)
    }
}
