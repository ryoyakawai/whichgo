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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupNavigationBar()

        self.imageViews = [imageView1, imageView2]
        imageView1.image = UIImage(named: "course1")
        imageView2.image = UIImage(named: "course2")
        
        self.blackViews = [blackView1, blackView2]
        for blackView in blackViews {
            blackView.backgroundColor = UIColor.clearColor()
            var layer = gradientLayer(blackView.bounds)
            blackView.layer.insertSublayer(layer, atIndex: 0)
        }
        
        self.labels = [label1, label2]
        var spotName:[String] = ["21世紀美術館", "石川県立美術館"]
        for i in 0..<labels.count {
            labels[i].text = spotName[i]
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func tapImage1(sender: AnyObject) {
        performSegueWithIdentifier("NextSegue", sender: sender)
    }

    @IBAction func tapImage2(sender: AnyObject) {
        performSegueWithIdentifier("NextSegue", sender: sender)
    }
}
