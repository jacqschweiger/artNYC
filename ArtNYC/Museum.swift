//
//  Museum.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/13/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class Museum: NSObject, MKAnnotation {

    let title: String?
    let address: String
    let logo: UIImage
    let hours: [String: String]
    let ticketPrice: String
    let freeHours: String
    let artCategories: String
    let coordinate: CLLocationCoordinate2D
    
//    convenience init(locationName: String, address: String) {
//        self.init(title: "test", locationName: locationName, logo: UIImage(named: "placeholder")!, address: address, hours: ["0":"0"], ticketPrice: "$0", freeHours: "0", artCategories: "0", coordinate: CLLocationCoordinate2D(latitude: 40.7794, longitude: -73.9634))
//    }
    
    init(title: String, logo: UIImage, address: String, hours: [String: String], ticketPrice: String, freeHours: String, artCategories: String, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.logo = logo
        self.address = address
        self.hours = hours
        self.ticketPrice = ticketPrice
        self.freeHours = freeHours
        self.artCategories = artCategories
        self.coordinate = coordinate
        
        super.init()
    }
}
