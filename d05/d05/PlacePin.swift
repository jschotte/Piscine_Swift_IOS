//
//  PlacePin.swift
//  d05
//
//  Created by Jeremy SCHOTTE on 1/15/18.
//  Copyright © 2018 Jeremy SCHOTTE. All rights reserved.
//

import UIKit
import MapKit

class PlacePin: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(name: String, coord: CLLocationCoordinate2D, sub: String)
    {
        self.title = name
        self.coordinate = coord
        self.subtitle = sub
    }
}
