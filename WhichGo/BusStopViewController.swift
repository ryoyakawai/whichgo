//
//  BusStopViewController.swift
//  WhichGo
//
//  Created by akio0911 on 2014/12/13.
//  Copyright (c) 2014年 akio0911. All rights reserved.
//

import UIKit
import MapKit

class BusStopViewController: UIViewController {

    @IBOutlet weak var timeLabel1: UILabel!
    @IBOutlet weak var timeLabel2: UILabel!
    
    var timeInterval1:NSTimeInterval = 60*10
    var timeInterval2:NSTimeInterval = 60*20
    
    var spots:NSArray = []
    var spotIndex:Int = 0
    var spotNumber:Int = 0
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupNavigationBar()
        
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update", userInfo: nil, repeats: true)

        var spot = spots[spotIndex] as NSDictionary
        var lat = (spot["Latitude"] as NSString).doubleValue
        var lng = (spot["Longtitute"] as NSString).doubleValue
        var coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        self.mapView.setCenterCoordinate(coordinate, animated: true)
        
        var zoom = self.mapView.region
        zoom.center = coordinate
        zoom.span.latitudeDelta = 0.005
        zoom.span.longitudeDelta = 0.005
        self.mapView.setRegion(zoom, animated: true)
        
    }
    
    func update() {
        timeInterval1--;
        timeInterval2--;
        updateTimeLabel()
    }
    
    func updateTimeLabel() {
        self.timeLabel1.text = NSString(format: "%02d:%02d", Int(timeInterval1)/60, Int(timeInterval1)%60)
        self.timeLabel2.text = NSString(format: "%02d:%02d", Int(timeInterval2)/60, Int(timeInterval2)%60)
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
            var busMap = segue.destinationViewController as BusMapViewController
            busMap.spots = self.spots
            busMap.spotIndex = self.spotIndex
            busMap.spotNumber = self.spotNumber
        }
    }

}
