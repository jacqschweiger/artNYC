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
import FirebaseDatabase

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
    
    init(snapshot: FIRDataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        title = snapshotValue["title"] as! String
        address = snapshotValue["address"] as! String
        logo = UIImage(named: snapshotValue["logo"] as! String)!
        hours = snapshotValue["hours"] as! String
        ticketPrice = snapshotValue["ticketPrice"] as! String
        freeHours = snapshotValue["freeHours"] as! String
        freeDay = snapshotValue["freeDay"] as! [Int]
        artCategories = snapshotValue["artCategories"] as! String
        guard let coordinates = snapshotValue["coordinate"] as? [String : Int] else { return }
        coordinate = CLLocationCoordinate2D(latitude: coordinates["latitude"] as? Int, longitude: coordinates["longitude"] as! Int)
        url = snapshotValue["url"] as! String
        interiorMapView = snapshotValue["interiorMapView"] as! Bool
        imageURL = snapshotValue["imageURL"] as! String
        imageCredit = snapshotValue["imageCredit"] as! String
        placeID = snapshotValue["placeID"] as! String
    }
    
}
