//
//  MuseumDataStore.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 1/13/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import FirebaseDatabase

class MuseumDataStore {
    
    static let sharedInstance = MuseumDataStore()
    let ref = FIRDatabase.database().reference(withPath: "museums")
    
    var filteredMuseums: [Museum] = []
    var allMuseums: [Museum] = []
    var interiorViewSwitchIsOn: Bool = false
    var freeAdmissionSwitchIsOn: Bool = false
    var openLateSwitchIsOn: Bool = false
    
    func loadMuseums() {
        print("load called")
        ref.observe(.value, with: { (snapshot) in
            
            for item in snapshot.children.allObjects as! [FIRDataSnapshot] {
                guard let itemDict = item.value as? [String: Any] else { return }
                guard let title = itemDict["title"] as? String else { return }
                guard let logoString = itemDict["logo"] as? String else { return }
                guard let logo = UIImage(named: logoString) else { return }
                guard let address = itemDict["address"] as? String else { return }
                guard let hours = itemDict["hours"] as? String else { return }
                guard let freeHours = itemDict["freeHours"] as? String else { return }
                guard let freeDay = itemDict["freeDay"] as? [Int] else { return }
                guard let artCategories = itemDict["artCategories"] as? String else { return }
                let coordinate = CLLocationCoordinate2D(latitude: -40, longitude: 70)
                guard let url = itemDict["url"] as? String else { return }
                guard let interiorMapView = itemDict["interiorMapView"] as? Bool else { return }
                guard let openLate = itemDict["openLate"] as? Bool else { return }
                guard let freeAdmission = itemDict["freeAdmission"] as? Bool else { return }
                guard let imageURL = itemDict["imageURL"] as? String else { return }
                guard let imageCredit = itemDict["imageCredit"] as? String else { return }
                guard let placeID = itemDict["placeID"] as? String else { return }
                guard let ticketPrice = itemDict["ticketPrice"] as? String else { return }

                
                let newFBMuseum = Museum(title: title, logo: logo, address: address, hours: hours, ticketPrice: ticketPrice, freeHours: freeHours, freeDay: freeDay, artCategories: artCategories, coordinate: coordinate, url: url, interiorMapView: interiorMapView, openLate: openLate, freeAdmission: freeAdmission, imageURL: imageURL, imageCredit: imageCredit, placeID: placeID)
                print("******\n\n\n\\n\n\(newFBMuseum.title!)!")
                self.allMuseums.append(newFBMuseum)
            }
        })
    }
    
    
    func getHours(with completion: @escaping ()->()) {
        for museum in self.allMuseums {
            GoogleAPIClient.getHours(with: museum.placeID, completion: { (results) in
                museum.hours = results.joined(separator: "\n").replacingOccurrences(of: ":00", with: "").replacingOccurrences(of: " AM", with: "am").replacingOccurrences(of: " PM", with: "pm")
            })
        }
        completion()
        
    }
    
}
