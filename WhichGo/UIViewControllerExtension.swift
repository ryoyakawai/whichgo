//
//  ViewControllerExtension.swift
//  WhichGo
//
//  Created by akio0911 on 2014/12/14.
//  Copyright (c) 2014年 akio0911. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func gradientLayer(frame:CGRect) -> CAGradientLayer {
        var pageGradient = CAGradientLayer()
        pageGradient.frame = frame
        pageGradient.colors = [UIColor(white: 0.0, alpha: 0.0).CGColor, UIColor(white: 0.0, alpha: 1.0).CGColor]
        return pageGradient
    }
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "BarBackground"), forBarMetrics: .Default)
        
        var titleImage = UIImage(named: "BarTitle")
        var titleImageView = UIImageView(image: titleImage)
        titleImageView.frame = CGRectMake(0, 0, 112, 19)
        self.navigationItem.titleView = titleImageView
    }
    
}
