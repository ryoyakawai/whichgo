//
//  MenuViewController.swift
//  WhichGo
//
//  Created by akio0911 on 2014/12/13.
//  Copyright (c) 2014年 akio0911. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var blackView1: UIView!
    @IBOutlet weak var blackView2: UIView!
    @IBOutlet weak var blackView3: UIView!
    @IBOutlet weak var blackView4: UIView!
    
    
    var imageViews:[UIImageView] = []
    var labels:[UILabel] = []
    var blackViews:[UIView] = []
    
    var spots:NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupNavigationBar()
        
        imageViews = [imageView1, imageView2, imageView3, imageView4]
        for i in 0..<imageViews.count {
            var imageView = imageViews[i]
            imageView.image = UIImage(named: "course\(i+1)")
        }
        
        blackViews = [blackView1, blackView2, blackView3, blackView4]
        for blackView in blackViews {
            var layer = gradientLayer(blackView.bounds)
            blackView.layer.insertSublayer(layer, atIndex: 0)
        }

        labels = [label1, label2, label3, label4]
        var courseName:[String] = ["食い倒れる金沢", "わかりやすく金沢", "底知れぬ金沢", "ROAD OF NINJA"]
        for i in 0..<labels.count {
            labels[i].text = courseName[i]
        }
        
        getData()
    }
    
    // API取得の開始処理
    func getData() {
        if var url = NSURL(string: "http://ryoyakawai.github.io/whichgo/html/data/kanazawa.json") {
            let req = NSURLRequest(URL: url)
            if var connection = NSURLConnection(request: req, delegate: self, startImmediately: false) {
                // NSURLConnectionを使ってAPIを取得する
                NSURLConnection.sendAsynchronousRequest(req,
                    queue: NSOperationQueue.mainQueue(),
                    completionHandler: response)
            }
        }
    }
    
    // 取得したAPIデータの処理
    func response(res: NSURLResponse!, data: NSData!, error: NSError!){
        let json:NSDictionary = NSJSONSerialization.JSONObjectWithData(data,
            options: NSJSONReadingOptions.AllowFragments, error: nil) as NSDictionary
        
        self.spots = json.objectForKey("Sheet1") as NSArray
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
            var which = segue.destinationViewController as WhichViewController
            which.spots = self.spots
            which.firstIndex = 0
            which.secondIndex = 1
        }
    }
    
    func performNextSegue(sender: AnyObject) {
        performSegueWithIdentifier("NextSegue", sender: sender)
    }
    
    @IBAction func tapImageView(sender: AnyObject) {
        performNextSegue(sender)
    }
    
}
