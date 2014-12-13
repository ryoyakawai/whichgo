//
//  TestViewController.swift
//  WhichGo
//
//  Created by akio0911 on 2014/12/13.
//  Copyright (c) 2014年 akio0911. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    // http://qiita.com/yimajo/items/ca11f9a5fcf623294d26
    @IBAction func pressButton1(sender: AnyObject) {
        let path  = NSBundle.mainBundle().pathForResource("dummydata", ofType: "json")
        
        if var p=path{
            let fileHandle = NSFileHandle(forReadingAtPath: p)
            let data : NSData? = fileHandle?.readDataToEndOfFile()
            
            if var d = data {
                let json:NSDictionary = NSJSONSerialization.JSONObjectWithData(d,
                    options: NSJSONReadingOptions.AllowFragments, error: nil) as NSDictionary
                
                let res:NSDictionary = json.objectForKey("response") as NSDictionary
                let pref:NSArray = res.objectForKey("prefecture") as NSArray

                // １行ずつログに表示
                for var i=0 ; i<pref.count ; i++ {
                    println(pref[i])
                }
                
            } else {
                //dataがnilだとNSInvalidArgumentExceptionで例外になるよ
            }
        }
            
    }
    // API取得の開始処理
/*
    func getData() {
        //let URL = NSURL(string: "http://express.heartrails.com/api/json?method=getPrefectures")

        let jsonResource = NSBundle.mainBundle().pathForResource(“dummydata”, ofType: “json”) // filename, fileextension
        let data = NSData(contentsOfFile: jsonResource)
        let resultDict : AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil)


        
        if var u = URL {
            let req = NSURLRequest(URL: u)
            // let connection: NSURLConnection = NSURLConnection(request: req, delegate: self, startImmediately: true)
            // let connection: NSURLConnection = NSURLConnection(request: req, delegate: self, startImmediately: false)
            // NSURLConnectionを使ってAPIを取得する
            
            NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue.mainQueue(), completionHandler: { (response:NSURLResponse!,
                data:NSData!, error:NSError!) -> Void in
                
                let json:NSDictionary = NSJSONSerialization.JSONObjectWithData(data,
                    options: NSJSONReadingOptions.AllowFragments, error: nil) as NSDictionary
                
                let res:NSDictionary = json.objectForKey("response") as NSDictionary
                let pref:NSArray = res.objectForKey("prefecture") as NSArray
                
                // １行ずつログに表示
                for var i=0 ; i<pref.count ; i++ {
                    println(pref[i])
                }
                
                //
                println("done")
            })
        } else {
            println("error")
        }
        
    }
    
    // 取得したAPIデータの処理
    func response(res: NSURLResponse!, data: NSData!, error: NSError!){
        
        println(data)
        
    }
*/
    @IBAction func pressButton2(sender: AnyObject) {
    }
    
    @IBAction func pressButton3(sender: AnyObject) {
    }
    
    @IBAction func pressButton4(sender: AnyObject) {
    }
    
    @IBAction func pressButton5(sender: AnyObject) {
    }
}
