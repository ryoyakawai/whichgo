//
//  SpotViewController.swift
//  WhichGo
//
//  Created by akio0911 on 2014/12/13.
//  Copyright (c) 2014年 akio0911. All rights reserved.
//

import UIKit

class SpotViewController: UIViewController {

    var spots:NSArray = []
    var spotIndex:Int = 0
    var spotNumber:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if var spot = spots[spotIndex] as? NSDictionary {
            if var id = spot["ID"] as? String {
                var string:String = "http://ryoyakawai.github.io/whichgo/html/index.html?p=\(id)"
                var urlOpt:NSURL? = NSURL(string:string)
                if var url = urlOpt {
                    var request:NSURLRequest = NSURLRequest(URL:url)
                    self.webView.loadRequest(request)
                }
            }
        }
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
            
            //Children
            if var spot = spots[spotIndex] as? NSDictionary {
                if var child1String = spot["Children_0"] as? String {
                    println(child1String)
                    
                    if var child1 = child1String.toInt() {
                        for spot2 in spots {
                            if var noString = spot2["No."] as? String {
                                if var no = noString.toInt() {
                                    if child1 == no {
                                        which.firstIndex = child1
                                    }
                                }
                            }
                        }
                    }
                    
                }
                if var child2String = spot["Children_1"] as? String {
                    println(child2String)
                    
                    if var child2 = child2String.toInt() {
                        for spot2 in spots {
                            if var noString = spot2["No."] as? String {
                                if var no = noString.toInt() {
                                    if child2 == no {
                                        which.secondIndex = child2
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            println(which.firstIndex)
            println(which.secondIndex)
            
//            which.spotIndex = self.spotIndex
//            which.spotNumber = self.spotNumber
        }
    }

    @IBOutlet weak var webView: UIWebView!
    
}
