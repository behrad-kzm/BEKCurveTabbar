//
//  TabbarHeightRatios.swift
//  BEKCurveTabbar
//
//  Created by Behrad Kazemi on 12/21/19.
//  Copyright © 2019 BEKApps. All rights reserved.
//

import Foundation
import UIKit
enum TabbarHeightRatios: Float {
    case iPhone = 0.15
    case iPhoneX = 0.12
    case iPad = 0.09
    case notDetermined = -1.0
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
            break
        case .pad:
            return .iPad
        default:
            return .notDetermined
        }
    }()
}
