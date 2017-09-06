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
    var hours: String
    let ticketPrice: String
    let freeHours: String
    let freeDay: [Int]
    let artCategories: String
    let coordinate: CLLocationCoordinate2D
    let url: String
    let interiorMapView: Bool
    let openLate: Bool
    let freeAdmission: Bool
    var imageURL: String
    var imageCredit: String
    let placeID: String
    
    init(title: String, logo: UIImage, address: String, hours: String, ticketPrice: String, freeHours: String, freeDay: [Int], artCategories: String, coordinate: CLLocationCoordinate2D, url: String, interiorMapView: Bool, openLate: Bool, freeAdmission: Bool, imageURL: String, imageCredit: String, placeID: String){
        self.title = title
        self.logo = logo
        self.address = address
        self.hours = hours
        self.ticketPrice = ticketPrice
        self.freeHours = freeHours
        self.freeDay = freeDay
        self.artCategories = artCategories
        self.coordinate = coordinate
        self.url = url
        self.interiorMapView = interiorMapView
        self.openLate = openLate
        self.freeAdmission = freeAdmission
        self.imageURL = imageURL
        self.imageCredit = imageCredit
        self.placeID = placeID
        
        super.init()
    }
    
}
