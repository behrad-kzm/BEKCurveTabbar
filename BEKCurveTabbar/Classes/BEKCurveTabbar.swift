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
     Margin is the space from the tabbar to Left Right and Bottom edge of screen.
     - Default is 12.0
     */
    @IBInspectable public var margin: CGFloat = TabbarHeightRatios.bestSize.margin() {
        didSet {
            layoutIfNeeded()
        }
    }
    
    /**
     CornerRadius  for Tabbar container.
     - Default is 16.0
     */
    @IBInspectable public var cornerRadious: CGFloat = TabbarHeightRatios.bestSize.cornerRadius(){
        didSet {
            layoutIfNeeded()
        }
    }
    
    /**
     circleRadius  for Tabbar selected item background.
     - Default is 42.0
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
     Will borderColor of Tabbar container.
     - Default is Clear Color.
     */
    @IBInspectable public var borderColor: UIColor = .clear  {
        didSet {
            layoutIfNeeded()
        }
    }
    
    /**
     Will border width of Tabbar container.
     - Default is 1.0.
     */
    @IBInspectable public var borderWidth: CGFloat = 1.0  {
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
    @IBInspectable public var hidesWhenDeseleted: Bool = true
    
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
    @IBInspectable public var shadowColor: UIColor = .black  {
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
    
    //MARK:- Methodes
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = borderColor.cgColor
        shapeLayer.fillColor = tabbarColor.cgColor
        shapeLayer.lineWidth = borderWidth
        shapeLayer.shadowColor = shadowColor.cgColor
        shapeLayer.shadowRadius = shadowRadius
        let circleSelectionView = CAShapeLayer()
        if let imageView = (selectedItem?.value(forKey: "view") as? UIView)?.subviews.first {
            var center = imageView.center
            center.y += 1
            center.x += 1
            let radius = circleRadius
            circleSelectionView.path = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(0), endAngle:CGFloat(.pi * 2.0), clockwise: true).cgPath
            circleSelectionView.strokeColor = borderColor.cgColor
            circleSelectionView.fillColor = UIColor.red.cgColor
            circleSelectionView.lineWidth = borderWidth
            circleSelectionView.shadowColor = shadowColor.cgColor
            circleSelectionView.shadowRadius = shadowRadius
        }
        if let oldShapeLayer = self.shapeLayer, let oldCircle = self.circleLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
            self.layer.replaceSublayer(oldCircle, with: circleSelectionView)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
            self.layer.insertSublayer(circleSelectionView, at: 1)
        }
        self.shapeLayer = shapeLayer
        self.circleLayer = circleSelectionView
    }
    
    override public func draw(_ rect: CGRect) {
        self.addShape()
    }
    
    override public func sizeThatFits(_ size: CGSize) -> CGSize {
        let ratioConvertion = UIScreen.main.bounds.height * heightRatio
        let height = ratioConvertion > 0 && heightRatio < 1.0 ? ratioConvertion : UIScreen.main.bounds.height * CGFloat(TabbarHeightRatios.bestSize.rawValue)
        let insideRectHeight = (height - 2 * cornerRadious) > 0 ? (height - 2 * cornerRadious) : 0.0
        let realHeight = insideRectHeight + 2 * cornerRadious + 2 * margin
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = realHeight
        return sizeThatFits
    }
    override public func layoutIfNeeded() {
        items?.forEach({ (item) in
            if let imageView = (item.value(forKey: "view") as? UIView)?.subviews.first {
                let iconFrame = imageView.frame
                let bottomOfIcon = iconFrame.origin.y + iconFrame.width
                let bottomOfCircle = imageView.center.y + circleRadius
                let safeOffset = abs(bottomOfIcon - bottomOfCircle)
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -margin + labelOffset + safeOffset)
            }else{
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -margin + labelOffset)
            }
            item.imageInsets = UIEdgeInsets(top: margin, left: 0, bottom: 0, right: 0)//todo
            item.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
            item.setTitleTextAttributes([NSAttributedString.Key.font: selectedFont,NSAttributedString.Key.foregroundColor: selectedTextColor], for: .selected)
            item.setTitleTextAttributes([NSAttributedString.Key.font: selectedFont,NSAttributedString.Key.foregroundColor: textColor], for: .normal)
            
            
        })
        unselectedItemTintColor = selectedColor
        tintColor = barTintColor
        super.layoutIfNeeded()
    }
    func createPath() -> CGPath {
        
        //Properties
        let path = UIBezierPath()
        let ratioConvertion = UIScreen.main.bounds.height * heightRatio
        let height = ratioConvertion > 0 && heightRatio < 1.0 ? ratioConvertion : UIScreen.main.bounds.height * CGFloat(TabbarHeightRatios.bestSize.rawValue)
        let insideRectHeight = (height - 2 * cornerRadious) > 0 ? (height - 2 * cornerRadious) : 0.0
        let realHeight = insideRectHeight + 2 * cornerRadious
        
        //Corners
        let firstCorner = CGPoint(x: margin, y: 0)
        let secondCorner = CGPoint(x: margin, y: margin + realHeight)
        let thirdCorner = CGPoint(x: bounds.width - margin, y: margin + realHeight)
        let fourthCorner = CGPoint(x: bounds.width - margin, y: 0)
        
        //Curve Points
        let startPoint = CGPoint(x: margin + cornerRadious, y: 0)
        let firstPoint = CGPoint(x: margin, y:  cornerRadious)
        let secondCurvePoint1 = CGPoint(x: margin, y: insideRectHeight + margin + cornerRadious)
        let secondCurvePoint2 = CGPoint(x: margin + cornerRadious, y: insideRectHeight + 2 * cornerRadious + margin)
        let thirdCurvePoint1 = CGPoint(x: bounds.width - margin - cornerRadious, y: insideRectHeight + margin + 2 * cornerRadious)
        let thirdCurvePoint2 = CGPoint(x: bounds.width - margin, y: insideRectHeight + margin + cornerRadious)
        let endCurvePoint1 = CGPoint(x: bounds.width - margin, y:  cornerRadious)
        let endPoint = CGPoint(x: bounds.width - margin - cornerRadious, y: 0)
        
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
}
