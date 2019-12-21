//
//  BEKCurveTabbar.swift
//  BEKCurveTabbar
//
//  Created by Behrad Kazemi on 12/21/19.
//  Copyright © 2019 BEKApps. All rights reserved.
//

import UIKit

@IBDesignable
class BEKCurveTabbar: UITabBar {
    
    @IBInspectable public var heightRatio: CGFloat = CGFloat(TabbarHeightRatios.bestSize.rawValue) {
        didSet {
            layoutIfNeeded()
        }
    }
    
    @IBInspectable public var margin: CGFloat = 12.0 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    @IBInspectable public var cornerRadious: CGFloat = 16.0 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    @IBInspectable public var selectedColor: UIColor = .blue  {
        didSet {
            layoutIfNeeded()
        }
    }
    
    @IBInspectable public var tabbarColor: UIColor = .white  {
        didSet {
            layoutIfNeeded()
        }
    }
    
    @IBInspectable public var textColor: UIColor = .blue  {
        didSet {
            layoutIfNeeded()
        }
    }
    
    @IBInspectable public var borderColor: UIColor = .clear  {
        didSet {
            layoutIfNeeded()
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 1.0  {
        didSet {
            layoutIfNeeded()
        }
    }
    
    @IBInspectable public var hidesWhenDeseleted: Bool = true
    
    @IBInspectable public var font: UIFont = .systemFont(ofSize: 11)  {
        didSet {
            layoutIfNeeded()
        }
    }
    
    @IBInspectable public var shadowColor: UIColor = .black  {
        didSet {
            layoutIfNeeded()
        }
    }
    @IBInspectable public var shadowRadius: CGFloat = 30.0  {
        didSet {
            layoutIfNeeded()
        }
    }
    
    private var shapeLayer: CALayer?
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = borderColor.cgColor
        shapeLayer.fillColor = tabbarColor.cgColor
        shapeLayer.lineWidth = borderWidth
        shapeLayer.shadowColor = shadowColor.cgColor
        shapeLayer.shadowRadius = shadowRadius
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    override func draw(_ rect: CGRect) {
        self.addShape()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let ratioConvertion = UIScreen.main.bounds.height * heightRatio
        let height = ratioConvertion > 0 && heightRatio < 1.0 ? ratioConvertion : UIScreen.main.bounds.height * CGFloat(TabbarHeightRatios.bestSize.rawValue)
        let insideRectHeight = (height - 2 * cornerRadious) > 0 ? (height - 2 * cornerRadious) : 0.0
        let realHeight = insideRectHeight + 2 * cornerRadious + 2 * margin
        
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = realHeight
        return sizeThatFits
    }
    
    func createPath() -> CGPath {
        
        //Properties
        let path = UIBezierPath()
        let ratioConvertion = UIScreen.main.bounds.height * heightRatio
        let height = ratioConvertion > 0 && heightRatio < 1.0 ? ratioConvertion : UIScreen.main.bounds.height * CGFloat(TabbarHeightRatios.bestSize.rawValue)
        let insideRectHeight = (height - 2 * cornerRadious) > 0 ? (height - 2 * cornerRadious) : 0.0
        let realHeight = insideRectHeight + 2 * cornerRadious
        //        let newFrame = CGRect(
        
        //Corners
        let firstCorner = CGPoint(x: margin, y: margin)
        let secondCorner = CGPoint(x: margin, y: margin + realHeight)
        let thirdCorner = CGPoint(x: bounds.width - margin, y: margin + realHeight)
        let fourthCorner = CGPoint(x: bounds.width - margin, y: margin)
        
        //Curve Points
        let startPoint = CGPoint(x: margin + cornerRadious, y: margin)
        let firstPoint = CGPoint(x: margin, y: margin + cornerRadious)
        let secondCurvePoint1 = CGPoint(x: margin, y: insideRectHeight + margin + cornerRadious)
        let secondCurvePoint2 = CGPoint(x: margin + cornerRadious, y: insideRectHeight + 2 * cornerRadious + margin)
        let thirdCurvePoint1 = CGPoint(x: bounds.width - margin - cornerRadious, y: insideRectHeight + margin + 2 * cornerRadious)
        let thirdCurvePoint2 = CGPoint(x: bounds.width - margin, y: insideRectHeight + margin + cornerRadious)
        let endCurvePoint1 = CGPoint(x: bounds.width - margin, y: margin + cornerRadious)
        let endPoint = CGPoint(x: bounds.width - margin - cornerRadious, y: margin)
        
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
