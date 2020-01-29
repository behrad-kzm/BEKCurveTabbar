//
//  DefaultTabBarViewModel.swift
//  BEKCurveTabbar
//
//  Created by Behrad Kazemi on 12/24/19.
//  Copyright © 2019 BEKApps. All rights reserved.
//

import Foundation
import UIKit

public struct DefaultTabBarViewModel: BEKTabBarViewModelType {

    public var heightRatio: CGFloat = CGFloat(TabbarHeightRatios.bestSize.rawValue)
    public let containerColor: UIColor = .white
    public let hideTitle: Bool = true
    public let animationDuration: CGFloat = 0.1
    public let animated: Bool = true
    public let shadowColor: UIColor = UIColor(white: 0, alpha: 0.3)
    public let shadowRadius: CGFloat = 32
    public let containerBorderWidth: CGFloat = 0.0
    public let containerBorderColor: UIColor = .clear
    public let selectedTextColor: UIColor = UIColor(red: 0.353, green: 0.784, blue: 1, alpha: 1.0)
    public let selectedTextFont: UIFont = .systemFont(ofSize: 13)
    public let normalTextColor: UIColor = .lightGray
    public let normalTextFont: UIFont = .systemFont(ofSize: 11)
    public let topCornerRadius: CGFloat = TabbarHeightRatios.bestSize.cornerRadius()
    public let bottomCornerRadius: CGFloat = TabbarHeightRatios.bestSize.cornerRadius()
    public let containerInsets: UIEdgeInsets = TabbarHeightRatios.bestSize.containerInsets()
    public let selectionCircleRadius: CGFloat = TabbarHeightRatios.bestSize.circleRadius()
    public let selectionCircleBorderWidth: CGFloat = 0.0
    public let selectionCircleBorderColor: UIColor = .clear
    public let selectionCircleBackgroundColor: UIColor = UIColor(red: 0.353, green: 0.784, blue: 1, alpha: 1.0)
    public let textOffset: CGFloat = 0
    public let animationSpeed: CGFloat = 1.0
    public init() {}
}
