//
//  WhichViewController.swift
//  WhichGo
//
//  Created by akio0911 on 2014/12/13.
//  Copyright (c) 2014年 akio0911. All rights reserved.
//

import UIKit

class WhichViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
    var imageViews:[UIImageView] = []
    
    @IBOutlet weak var blackView1: UIView!
    @IBOutlet weak var blackView2: UIView!
    
    var blackViews:[UIView] = []
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    var labels:[UILabel] = []
    
    var spots:NSArray = []
    var spotIndex:Int = -1
    var spotNumber:Int = -1

    var firstIndex:Int = -1
    var firstNumber:Int = -1
    
    var secondIndex:Int = -1
    var secondNumber:Int = -1
    
    var selected:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupNavigationBar()

        self.imageViews = [imageView1, imageView2]
//        imageView1.image = UIImage(named: "course1")
//        imageView2.image = UIImage(named: "course2")
        var spotIndexes:[Int] = [firstIndex, secondIndex]
        for i in 0..<spotIndexes.count {
            var n = spotIndexes[i]
            var dic = spots[n] as NSDictionary
            var picURL = dic["PicURL_0"] as String
            
            if !picURL.hasPrefix("http://") {
                picURL = "http://ryoyakawai.github.io/whichgo/html/" + picURL
            }
            
            if var url = NSURL(string: picURL) {
                UIImage.downloadImage(url, handler: { (image, error) -> Void in
                    self.imageViews[i].image = image
                })
            }
        }
        
        self.blackViews = [blackView1, blackView2]
        for blackView in blackViews {
            blackView.backgroundColor = UIColor.clearColor()
            var layer = gradientLayer(blackView.bounds)
            blackView.layer.insertSublayer(layer, atIndex: 0)
        }
        
        self.labels = [label1, label2]
        
        
        for i in 0..<spotIndexes.count {
            var n = spotIndexes[i]
            var label = labels[i]
            if var place = spots[n]["Place"] as? String {
                label.text = place
            }
        }
        
        
//        if var place1 = spots[0]["Place"] as? String {
//            label1.text = place1
//        }
//        if var place2 = spots[1]["Place"] as? String {
//            label1.text = place2
//        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "NextSegue" {
            var busStop = segue.destinationViewController as BusStopViewController
            busStop.spots = self.spots
            switch selected {
            case 0:
                busStop.spotIndex = self.firstIndex
                busStop.spotNumber = self.firstNumber
            case 1:
                busStop.spotIndex = self.secondIndex
                busStop.spotNumber = self.secondNumber
            default:
                busStop.spotIndex = -1
                busStop.spotNumber = -1
            }
        }
    }

    @IBAction func tapImage1(sender: AnyObject) {
        self.selected = 0
        performSegueWithIdentifier("NextSegue", sender: sender)
    }

    @IBAction func tapImage2(sender: AnyObject) {
        self.selected = 1
        performSegueWithIdentifier("NextSegue", sender: sender)
    }
}
