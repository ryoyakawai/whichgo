//
//  BusMapViewController.swift
//  WhichGo
//
//  Created by akio0911 on 2014/12/13.
//  Copyright (c) 2014年 akio0911. All rights reserved.
//

import UIKit
import MapKit

class BusMapViewController: UIViewController {

    var spots:NSArray = []
    var spotIndex:Int = 0
    var spotNumber:Int = 0

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupNavigationBar()
        
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
            var spot = segue.destinationViewController as SpotViewController
            spot.spots = self.spots
            spot.spotIndex = self.spotIndex
            spot.spotNumber = self.spotNumber
        }
        
    }

}
