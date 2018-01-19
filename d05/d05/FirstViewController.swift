//
//  FirstViewController.swift
//  d05
//
//  Created by Jeremy SCHOTTE on 1/15/18.
//  Copyright © 2018 Jeremy SCHOTTE. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate
{
    
    var locationManager = CLLocationManager()
    
    @IBOutlet var mapview: MKMapView!
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    @IBAction func changeValue(_ sender: UISegmentedControl)
    {
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapview.mapType = .standard
        case 1:
            mapview.mapType = .satellite
        default:
            mapview.mapType = .hybrid
        }
    }
    
    @IBAction func zoomToUser(_ sender: UIButton)
    {
        var mapRegion = mapview.region
        mapRegion.center = mapview.userLocation.coordinate
        mapRegion.span.latitudeDelta = 0.01
        mapRegion.span.longitudeDelta = 0.01
        
        mapview.setRegion(mapRegion, animated: true)
    }
    
    @IBOutlet var segment: UISegmentedControl!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        mapview.showsUserLocation = true
        locationManager.delegate = self
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        
        mapview.mapType = .hybrid
        
        for elem in SecondViewController.lstPin
        {
            let pin = MKPointAnnotation()
            pin.title = elem.0
            pin.subtitle = elem.1
            pin.coordinate = CLLocationCoordinate2DMake(elem.2, elem.3)
            mapview.addAnnotation(pin)
        }
        
        var mapRegion = mapview.region
        let loc = CLLocationCoordinate2DMake(48.896748, 2.318515)
        mapRegion.center = loc
        mapRegion.span.latitudeDelta = 0.01
        mapRegion.span.longitudeDelta = 0.01;
        self.mapview.setCenter(loc, animated: true)
        self.mapview.setRegion(mapRegion, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

