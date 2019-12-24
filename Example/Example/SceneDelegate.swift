//
//  SceneDelegate.swift
//  Example
//
//  Created by Behrad Kazemi on 12/24/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        self.window?.windowScene = windowScene
        window?.rootViewController = getConfiguredController()
        window?.makeKeyAndVisible()
    }
    
    func getDefaultController() -> UITabBarController {
        //Initiate your viewControllers
        let firstViewController = UIViewController()
        firstViewController.view.backgroundColor = .red
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let secondViewController = UIViewController()
        firstViewController.view.backgroundColor = .white
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        let thirdViewController = UIViewController()
        thirdViewController.view.backgroundColor = .blue
        thirdViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        
        //get instance of BEKCurveTabbarController
        let tabBarViewController = BEKCurveTabbarController.instantiate()
        
        //set viewControllers to the tabbar
        tabBarViewController.setViewControllers([firstViewController, secondViewController, thirdViewController], animated: true)
        return tabBarViewController
    }
    
    func getConfiguredController() -> UITabBarController {
        //1- Initiate your viewControllers
        let firstViewController = UIViewController()
        firstViewController.view.backgroundColor = .red
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let secondViewController = UIViewController()
        firstViewController.view.backgroundColor = .white
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        let thirdViewController = UIViewController()
        thirdViewController.view.backgroundColor = .blue
        thirdViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        
        //2- get instance of BEKCurveTabbarController
        let tabBarViewController = BEKCurveTabbarController.instantiate()
        
        //3- Config your own TabBar ViewModel
        let myViewModel = MyCustomTabBarViewModel()
        
        //4- setup TabBar Controller with you viewModel
        tabBarViewController.setupViewModel(viewModel: myViewModel)
        
        //5- set viewControllers to the tabbar
        tabBarViewController.setViewControllers([firstViewController, secondViewController, thirdViewController], animated: true)
        return tabBarViewController
    }
    
}

