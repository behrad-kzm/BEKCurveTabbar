//
//  TabbarViewController.swift
//  BEKCurveTabbar
//
//  Created by Behrad Kazemi on 12/23/19.
//  Copyright © 2019 BEKApps. All rights reserved.
//

import UIKit

public class BEKCurveTabbarController: UITabBarController {
    
    public static func instantiate() -> BEKCurveTabbarController
    {
        let controller = UIStoryboard(name: "Storyboard", bundle: Bundle(for: BEKCurveTabbarController.self)).instantiateViewController(withIdentifier: "BEKCurveTabbarController") as! BEKCurveTabbarController
        let defaultVM = DefaultTabBarViewModel()
        
        controller.setupViewModel(viewModel: defaultVM)
        return controller
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func setupViewModel(viewModel: BEKTabBarViewModelType = DefaultTabBarViewModel()){
        if let safeTabBar = tabBar as? BEKCurveTabbar  {
            safeTabBar.setup(viewModel: viewModel)
        }
    }
}
