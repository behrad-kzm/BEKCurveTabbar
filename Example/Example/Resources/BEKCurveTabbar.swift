//
//  BEKCurveTabbar.swift
//  BEKCurveTabbar
//
//  Created by Behrad Kazemi on 12/21/19.
//  Copyright © 2019 BEKApps. All rights reserved.
//

import UIKit

@IBDesignable
/// A customizable UITabbar by BEKApps.com
public class BEKCurveTabbar: UITabBar {
    //MARK:- Properties
    
    /**
     HeightRatio will cross with screen height to calculate tabbar height.
     - Default value will change in different enviroments iphone, iphoneX, iPad, etc.
     */
    @IBInspectable public var heightRatio: CGFloat = CGFloat(TabbarHeightRatios.bestSize.rawValue) {
        didSet {
            layoutIfNeeded()
        }
    }
    
    /**
     verticalMargin is the space from the tabbar to Bottom and Up edge of layout.
     - Default is 12.0
     */
    @IBInspectable public var verticalMargin: CGFloat = TabbarHeightRatios.bestSize.margin() {
        didSet {
            containerInsets = UIEdgeInsets(top: verticalMargin, left: containerInsets.left, bottom: verticalMargin, right: containerInsets.right)
            layoutIfNeeded()
        }
    }
    
    /**
     horizantalMargin is the space from the tabbar to Left and Right  edge of screen.
     - Default is 12.0
     */
    @IBInspectable public var horizantalMargin: CGFloat = TabbarHeightRatios.bestSize.margin() {
        didSet {
            containerInsets = UIEdgeInsets(top: containerInsets.top, left: horizantalMargin, bottom: containerInsets.bottom, right: horizantalMargin)
            layoutIfNeeded()
        }
    }
    
    /**
     CornerRadius  for Tabbar container.
     - Default value will change in different enviroments iphone, iphoneX, iPad, etc.
     */
    @IBInspectable public var cornerRadious: CGFloat = TabbarHeightRatios.bestSize.cornerRadius(){
        didSet {
            layoutIfNeeded()
        }
    }
    
    /**
     animationDuration  can change every animating time entire component.
     - Default is 0.3
     */
    @IBInspectable public var animationDuration: CFTimeInterval = 0.3{
        didSet {
            self.animationDuration = abs(self.animationDuration)
            layoutIfNeeded()
        }
    }
    /**
     circleRadius  for Tabbar selected item background.
     - Default value will change in different enviroments iphone, iphoneX, iPad, etc.
     */
    @IBInspectable public var circleRadius: CGFloat = TabbarHeightRatios.bestSize.circleRadius(){
        didSet {
            layoutIfNeeded()
        }
    }
    
    /**
     Change the circle view behind selected tab icon.
     - Default is Blue
     */
    @IBInspectable public var selectedColor: UIColor = .blue  {
        didSet {
            layoutIfNeeded()
        }
    }
    
    /**
     Change the Background color of Tabbar curve container.
     - Default is white
     */
    @IBInspectable public var tabbarColor: UIColor = .white  {
        didSet {
            layoutIfNeeded()
        }
    }
    
    /**
     textColor of titleLabel for not selected Tabs.
     - Default is Blue
     */
    @IBInspectable public var textColor: UIColor = .blue  {
        didSet {
            layoutIfNeeded()
        }
    }
    
    /**
     textColor of titleLabel for selected Tab.
     - Default is Blue.
     */
    @IBInspectable public var selectedTextColor: UIColor = .blue  {
        didSet {
            layoutIfNeeded()
        }
    }
    
    /**
      borderColor of Tabbar container.
     - Default is Clear Color.
     */
    @IBInspectable public var borderColor: UIColor = .clear  {
        didSet {
            layoutIfNeeded()
        }
    }
    
    /**
      border width of Tabbar container.
     - Default is 1.0.
     */
    @IBInspectable public var borderWidth: CGFloat = 1.0  {
        didSet {
            layoutIfNeeded()
        }
    }
    
    /**
      borderColor of Tabbar circle selection.
     - Default is Clear Color.
     */
    @IBInspectable public var selectionCircleBorderColor: UIColor = .clear  {
        didSet {
            layoutIfNeeded()
        }
    }
    
    /**
      border width of Tabbar circle selection..
     - Default is 1.0.
     */
    @IBInspectable public var selectionCircleBorderWidth: CGFloat = 1.0  {
        didSet {
            layoutIfNeeded()
        }
    }
    /**
     labelOffset is the space between tab's icon and the title lable
     - Default is 0.0.
     */
    @IBInspectable public var labelOffset: CGFloat = 0.0  {
        didSet {
            layoutIfNeeded()
        }
    }
    
    /**
     hidesWhenDeseleted will hide other labels that are not selected
     - Default is true.
     */
    @IBInspectable public var showTitle: Bool = true
    
    
    /**
     animated will stop animation of changing circle behind selected tab.
     - Default is true.
     */
    @IBInspectable public var animated: Bool = true
    
    
    /**
     font of titles.
     - Default is 11.
     */
    public var font: UIFont = .systemFont(ofSize: 11)  {
        didSet {
            layoutIfNeeded()
        }
    }
    
    /**
     font of titles when they are in selection mode.
     - Default is 11.
     */
    public var selectedFont: UIFont = .systemFont(ofSize: 11)  {
        didSet {
            layoutIfNeeded()
        }
    }
    /**
     shadow color of container view..
     - Default is black.
     */
    @IBInspectable public var shadowColor: UIColor = UIColor(white: 0, alpha: 0.2)  {
        didSet {
            layoutIfNeeded()
        }
    }
    /**
     shadow radius of container view .
     - Default is 30.0.
     */
    @IBInspectable public var shadowRadius: CGFloat = 30.0  {
        didSet {
            layoutIfNeeded()
        }
    }
    
    private var shapeLayer: CALayer?
    private var circleLayer: CALayer?
    public var containerInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    //MARK:- Methodes
    private func addBackgroundShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = borderColor.cgColor
        shapeLayer.fillColor = tabbarColor.cgColor
        shapeLayer.lineWidth = borderWidth
        shapeLayer.shadowColor = shadowColor.cgColor
        shapeLayer.shadowRadius = shadowRadius
        shapeLayer.shadowOffset = .zero
        shapeLayer.shadowOpacity = 1.0
        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    private func addCircleShape(){
        let circleSelectionView = CAShapeLayer()
        if let imageView = (selectedItem?.value(forKey: "view") as? UIView)?.subviews.first {
            var center = imageView.center
            center.y += 1
            center.x += 1
            let radius = circleRadius
            circleSelectionView.path = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(0), endAngle:CGFloat(.pi * 2.0), clockwise: true).cgPath
            circleSelectionView.strokeColor = selectionCircleBorderColor.cgColor
            circleSelectionView.fillColor = selectedColor.cgColor
            circleSelectionView.lineWidth = selectionCircleBorderWidth
        }
        if let oldCircle = self.circleLayer {
            layer.replaceSublayer(oldCircle, with: circleSelectionView)
        } else {
            layer.insertSublayer(circleSelectionView, at: 1)
        }
        circleLayer = circleSelectionView
    }
    
    override public func draw(_ rect: CGRect) {
        addBackgroundShape()
        addCircleShape()
    }
    
    override public func sizeThatFits(_ size: CGSize) -> CGSize {
        let ratioConvertion = UIScreen.main.bounds.height * heightRatio
        let height = ratioConvertion > 0 && heightRatio < 1.0 ? ratioConvertion : UIScreen.main.bounds.height * CGFloat(TabbarHeightRatios.bestSize.rawValue)
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = height
        return sizeThatFits
    }
    override public var selectedItem: UITabBarItem?{
        didSet{
            if showTitle {
                items?.forEach({ (item) in
                    hideLabel(barItem: item, hidden: showTitle)
                })
            }
            if let itemView = (selectedItem?.value(forKey: "view") as? UIView) {
                CATransaction.begin()
                CATransaction.setAnimationDuration(animated ? animationDuration : 0.0)
                circleLayer?.position = itemView.frame.origin
                CATransaction.commit()
            }
        }
    }
    override public func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        items?.forEach({ (item) in
            item.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
            item.setTitleTextAttributes([NSAttributedString.Key.font: selectedFont,NSAttributedString.Key.foregroundColor: selectedTextColor], for: .selected)
            item.setTitleTextAttributes([NSAttributedString.Key.font: selectedFont,NSAttributedString.Key.foregroundColor: textColor], for: .normal)
            hideLabel(barItem: item, hidden: showTitle)
        })
        unselectedItemTintColor = selectedColor
        tintColor = barTintColor
    }

    func createPath() -> CGPath {
        
        //Properties
        let path = UIBezierPath()
        let ratioConvertion = UIScreen.main.bounds.height * heightRatio
        let height = ratioConvertion > 0 && heightRatio < 1.0 ? ratioConvertion : UIScreen.main.bounds.height * CGFloat(TabbarHeightRatios.bestSize.rawValue)
        
        //Corners
        let firstCorner = CGPoint(x: containerInsets.left, y: containerInsets.top)
        let secondCorner = CGPoint(x: containerInsets.left, y: height - containerInsets.bottom)
        let thirdCorner = CGPoint(x: bounds.width - containerInsets.right, y: height - containerInsets.bottom)
        let fourthCorner = CGPoint(x: bounds.width - containerInsets.right, y: containerInsets.top)
        
        //Curve Points
        let startPoint = CGPoint(x: firstCorner.x + cornerRadious, y: firstCorner.y)
        let firstPoint = CGPoint(x: firstCorner.x, y:  firstCorner.y + cornerRadious)
        let secondCurvePoint1 = CGPoint(x: secondCorner.x, y: secondCorner.y - cornerRadious)
        let secondCurvePoint2 = CGPoint(x: secondCorner.x + cornerRadious, y: secondCorner.y)
        let thirdCurvePoint1 = CGPoint(x: thirdCorner.x - cornerRadious, y: thirdCorner.y)
        let thirdCurvePoint2 = CGPoint(x: thirdCorner.x, y: thirdCorner.y - cornerRadious)
        let endCurvePoint1 = CGPoint(x: fourthCorner.x, y:  fourthCorner.y + cornerRadious)
        let endPoint = CGPoint(x: fourthCorner.x - cornerRadious, y: fourthCorner.y)
        
        //Draw
        path.move(to: startPoint)
        path.addQuadCurve(to: firstPoint, controlPoint: firstCorner)
        path.addLine(to: secondCurvePoint1)
        path.addQuadCurve(to: secondCurvePoint2, controlPoint: secondCorner)
        path.addLine(to: thirdCurvePoint1)
        path.addQuadCurve(to: thirdCurvePoint2, controlPoint: thirdCorner)
        path.addLine(to: endCurvePoint1)
        path.addQuadCurve(to: endPoint, controlPoint: fourthCorner)
        path.addLine(to: startPoint)
        path.close()
        
        return path.cgPath
    }
    private func hideLabel(barItem: UITabBarItem, hidden: Bool) {
        
        if let itemView = (barItem.value(forKey: "view") as? UIView) {
            if let titleLabel = itemView.subviews.last {
                titleLabel.isHidden = hidden
            }
        }
    }
    
    public func setup(viewModel: BEKTabBarViewModelType){
        heightRatio = viewModel.heightRatio
        containerInsets = viewModel.containerInsets
        animationDuration = CFTimeInterval(viewModel.animationDuration)
        circleRadius = viewModel.selectionCircleRadius
        selectedColor = viewModel.selectionCircleBackgroundColor
        tabbarColor = viewModel.containerColor
        textColor = viewModel.normalTextColor
        selectedTextColor = viewModel.selectedTextColor
        borderColor = viewModel.containerBorderColor
        borderWidth = viewModel.containerBorderWidth
        labelOffset = viewModel.textOffset
        shadowRadius = viewModel.shadowRadius
        shadowColor = viewModel.shadowColor
        showTitle = viewModel.hideTitle
        animated = viewModel.animated
        barTintColor = viewModel.containerColor
        selectionCircleBorderColor = viewModel.selectionCircleBorderColor
        selectionCircleBorderWidth = viewModel.selectionCircleBorderWidth
        addBackgroundShape()
        addCircleShape()
        layoutIfNeeded()
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: labelOffset)
    }
}
