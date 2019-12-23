//
//  BEKTabBarViewController.swift
//  BEKCurveTabbar
//
//  Created by Behrad Kazemi on 12/23/19.
//

import UIKit

public class BEKTabBarViewController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        object_setClass(self.tabBar, BEKCurveTabbar.self)
        if let customBar = (self.tabBar as? BEKCurveTabbar){
            customBar.setup()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
