//
//  Museum.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 1/13/17.
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
    let url: String
    let interiorMapView: Bool
    var imageURL: String
    
    init(title: String, logo: UIImage, address: String, hours: [String: String], ticketPrice: String, freeHours: String, artCategories: String, coordinate: CLLocationCoordinate2D, url: String, interiorMapView: Bool, imageURL: String){
        self.title = title
        self.logo = logo
        self.address = address
        self.hours = hours
        self.ticketPrice = ticketPrice
        self.freeHours = freeHours
        self.artCategories = artCategories
        self.coordinate = coordinate
        self.url = url
        self.interiorMapView = interiorMapView
        self.imageURL = imageURL
        
        super.init()
    }
}
