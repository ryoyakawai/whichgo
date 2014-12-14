// Playground - noun: a place where people can play

import UIKit

"[12,34]"

var reg = NSRegularExpression(pattern: "(.*),(.*)", options: nil, error: nil)
var string = "123,45"
var matches = reg?.matchesInString(string, options: nil, range: NSMakeRange(0, countElements(string)))
//matches[0]

//NSArray *matches = [reg matchesInString:frogSong options:0 range:NSMakeRange(0, [frogSong length])];

var dic = NSDictionary(object: "object", forKey: "key")
dic


var str = "Hello, playground"

1+2

for i in 0 ... 100 {
    i
}


var a = 1
var s = "hello"

var s2:String? = "hello"

if var str = s2 {
    println(str)
} else {
    println("error")
}

/*
// API取得の開始処理
func getData() {
    let URL = NSURL(string: "http://express.heartrails.com/api/json?method=getPrefectures")
    
    if var u = URL {
        let req = NSURLRequest(URL: u)
//        let connection: NSURLConnection = NSURLConnection(request: req, delegate: self, startImmediately: true)
        let connection: NSURLConnection = NSURLConnection(request: req, delegate: self, startImmediately: false)
        
        // NSURLConnectionを使ってAPIを取得する
        
        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue.mainQueue(), completionHandler: { (response:NSURLResponse!,
            data:NSData!, error:NSError!) -> Void in
            
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

getData()


*/
