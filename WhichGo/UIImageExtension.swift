//
//  UIImageExtension.swift
//  WhichGo
//
//  Created by akio0911 on 2014/12/14.
//  Copyright (c) 2014年 akio0911. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    class func downloadImage(url: NSURL, handler: ((image: UIImage?, NSError!) -> Void))
    {
        var imageRequest: NSURLRequest = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(imageRequest,
            queue: NSOperationQueue.mainQueue(),
            completionHandler:{response, data, error in
                handler(image: UIImage(data: data), error)
        })
    }
}

