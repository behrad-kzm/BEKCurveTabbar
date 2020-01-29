//
//  BEKTabBarViewModelType.swift
//  BEKCurveTabbar
//
//  Created by Behrad Kazemi on 12/24/19.
//  Copyright © 2019 BEKApps. All rights reserved.
//

import Foundation
import UIKit
public protocol BEKTabBarViewModelType {
    var containerBorderWidth: CGFloat { get }
    var heightRatio: CGFloat { get }
    var containerBorderColor: UIColor { get }
    var containerColor: UIColor { get }
    var selectedTextColor: UIColor { get }
    var selectedTextFont: UIFont { get }
    var normalTextColor: UIColor { get }
    var normalTextFont: UIFont { get }
    var topCornerRadius: CGFloat { get }
    var bottomCornerRadius: CGFloat { get }
    var shadowColor: UIColor { get }
    var shadowRadius: CGFloat { get }
    var containerInsets: UIEdgeInsets { get }
    var selectionCircleRadius: CGFloat { get }
    var selectionCircleBorderWidth: CGFloat { get }
    var selectionCircleBorderColor: UIColor { get }
    var selectionCircleBackgroundColor: UIColor { get }
    var textOffset: CGFloat { get }
    var hideTitle: Bool { get }
    var animationDuration: CGFloat { get }
    var animated: Bool { get }
}
