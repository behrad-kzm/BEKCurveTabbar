//
//  MyCustomTabBarViewModel.swift
//  Example
//
//  Created by Behrad Kazemi on 12/24/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
struct MyCustomTabBarViewModel: BEKTabBarViewModelType {
    let heightRatio: CGFloat = CGFloat(TabbarHeightRatios.bestSize.rawValue)
    let containerColor: UIColor = .white
    let hideTitle: Bool = false
    let animationDuration: CGFloat = 0.3
    let animated: Bool = true
    let shadowColor: UIColor = UIColor(red: 0.353, green: 0.784, blue: 1, alpha: 1.0)
    let shadowRadius: CGFloat = 16
    let containerBorderWidth: CGFloat = 1.0
    let containerBorderColor: UIColor = .gray
    let selectedTextColor: UIColor = .yellow
    let selectedTextFont: UIFont = .systemFont(ofSize: 13)
    let normalTextColor: UIColor = .lightGray
    let normalTextFont: UIFont = .systemFont(ofSize: 11)
    let cornerRadius: CGFloat = 8
    let containerInsets: UIEdgeInsets = TabbarHeightRatios.bestSize.containerInsets()
    let selectionCircleRadius: CGFloat = TabbarHeightRatios.bestSize.circleRadius()
    let selectionCircleBorderWidth: CGFloat = 0.0
    let selectionCircleBorderColor: UIColor = .clear
    let selectionCircleBackgroundColor: UIColor = UIColor(red: 0.353, green: 0.784, blue: 1, alpha: 1.0)
    let textOffset: CGFloat = 0
    init() {}
}
