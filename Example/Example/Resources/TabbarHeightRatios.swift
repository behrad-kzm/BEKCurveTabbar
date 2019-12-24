//
//  TabbarHeightRatios.swift
//  BEKCurveTabbar
//
//  Created by Behrad Kazemi on 12/21/19.
//  Copyright © 2019 BEKApps. All rights reserved.
//

import Foundation
import UIKit
public enum TabbarHeightRatios: Float {
    case iPhone = 0.12
    case iPhoneX = 0.1201
    case iPad = 0.09
    case notDetermined = 0.2
    static let bestSize: TabbarHeightRatios = {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            switch UIScreen.main.nativeBounds.height {
                case 2436:
                     return .iPhoneX

                case 2688:
                    return .iPhoneX

                case 1792:
                    return .iPhoneX

                default:
                    return .iPhone
                }
        case .pad:
            return .iPad
        default:
            return .notDetermined
        }
    }()
    
    func circleRadius() -> CGFloat{
        return self == TabbarHeightRatios.iPhoneX ? 32 : 28
    }
    
    func margin() -> CGFloat{
        return self == TabbarHeightRatios.iPhoneX ? 10 : 5
    }
    
    func containerInsets() -> UIEdgeInsets{
        return self == TabbarHeightRatios.iPhoneX ? UIEdgeInsets(top: -10, left: 10, bottom: 32, right: 10) : UIEdgeInsets(top: -10, left: 0, bottom: -46, right: 0)
    }
    
    func cornerRadius() -> CGFloat{
        return self == TabbarHeightRatios.iPhoneX ? 46 : 10
    }

}
