//
//  ImageAndTextView.swift
//  WhichGo
//
//  Created by akio0911 on 2014/12/13.
//  Copyright (c) 2014年 akio0911. All rights reserved.
//

import UIKit

@IBDesignable class ImageAndTextView: UIView {
    
    @IBInspectable var iconImage: UIImage?
    @IBInspectable var text: String?
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        //        var redView = UIView()
        //        redView.frame = CGRectMake(10, 10, 10, 10)
        //        self.addSubview(redView)
        
        if let iconImage = self.iconImage {
            iconImage.drawInRect(self.bounds)
            
            //            let maskPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: CGRectGetWidth(self.bounds) / 2)
            //            let maskLayer = CAShapeLayer()
            //            maskLayer.path = maskPath.CGPath
            //            self.layer.mask = maskLayer;
        }
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let componentCount : UInt = 2
        
        let components : [CGFloat] = [
            0,   0,   0,   0,
            0.0, 0.0, 0.0, 1.0,
        ]
        
        let locations : [CGFloat] = [0, 1.0]
        
        let gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, componentCount)
        
        let startPoint = CGPoint(x: 0, y: CGRectGetHeight(bounds)/2)
        let endPoint = CGPoint(x: 0, y: CGRectGetHeight(bounds))
        
        let context = UIGraphicsGetCurrentContext()
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0)

        if var t = text {
            let textFontAttributes = [
                NSFontAttributeName : UIFont.boldSystemFontOfSize(24),
                NSForegroundColorAttributeName: UIColor.whiteColor(),
            ]
            t.drawInRect(CGRectMake(0, CGRectGetHeight(bounds)/4*3, CGRectGetWidth(bounds), CGRectGetHeight(bounds)), withAttributes: textFontAttributes)
        }
        
    }
    //    func customViewCommonInit(){
    //        var view = NSBundle.mainBundle().loadNibNamed("ImageAndTextView", owner: self, options: nil)[0] as UIView
    //        view.frame = self.bounds
    //
    //        view.setTranslatesAutoresizingMaskIntoConstraints(true)
    //        view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
    //
    //        self.addSubview(view)
    //    }
    
    //    required init(coder aDecoder: NSCoder) {
    //        super.init(coder: aDecoder)
    ////        println("coder")
    //        self.backgroundColor = UIColor.redColor()
    ////        self.customViewCommonInit()
    //    }
    //
    //    override init(frame: CGRect) {
    //        super.init(frame: frame)
    ////        println("frame")
    //        self.backgroundColor = UIColor.greenColor()
    ////        self.customViewCommonInit()
    //    }
    
    //    required init(coder aDecoder: NSCoder) {
    //        super.init(coder: aDecoder)
    //    }
    //
    //    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
    //        subview = UIView()
    //        super.init(nibName: nil, bundle: nil)
    //    }
    //
    //    convenience override init() {
    //        self.init(nibName: nil, bundle: nil)
    //    }
    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.backgroundColor = UIColor.redColor()
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: CGRectMake(0, 0, 0, 0))
//        self.backgroundColor = UIColor.greenColor()
//    }
//    
//    override init() {
//        super.init()
//        self.backgroundColor = UIColor.blueColor()
//    }
    
}

