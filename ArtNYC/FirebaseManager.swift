//
//  FirebaseManager.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 9/17/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import FirebaseDatabase
import UIKit
import MapKit

final class FirebaseManager {
    
    static let shared = FirebaseManager()
    let ref = FIRDatabase.database().reference(withPath: "museums")
    private init() {}

    
    func getFBSnapshot(with completion: @escaping ([[String: Any]])->()) {
        
        var museumDicts = [[String:Any]]()
        
        ref.observe(.value, with: { (snapshot) in
            
            for item in snapshot.children.allObjects as! [FIRDataSnapshot] {
                guard let itemDict = item.value as? [String: Any] else { return }
                museumDicts.append(itemDict)
            }
            completion(museumDicts)
        })
    }
    
}

            /*
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
                
                guard let coordinates = itemDict["coordinate"] as? [String: AnyObject] else { return }
                guard let latitude = coordinates["latitude"] as? Double else { return }
                guard let longitude = coordinates["longitude"] as? Double else { return }
                let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                
                guard let url = itemDict["url"] as? String else { return }
                guard let interiorMapView = itemDict["interiorMapView"] as? Bool else { return }
                guard let openLate = itemDict["openLate"] as? Bool else { return }
                guard let freeAdmission = itemDict["freeAdmission"] as? Bool else { return }
                guard let imageURL = itemDict["imageURL"] as? String else { return }
                guard let imageCredit = itemDict["imageCredit"] as? String else { return }
                guard let placeID = itemDict["placeID"] as? String else { return }
                guard let ticketPrice = itemDict["ticketPrice"] as? String else { return }
                
                
                let newFBMuseum = Museum(title: title, logo: logo, address: address, hours: hours, ticketPrice: ticketPrice, freeHours: freeHours, freeDay: freeDay, artCategories: artCategories, coordinate: coordinate, url: url, interiorMapView: interiorMapView, openLate: openLate, freeAdmission: freeAdmission, imageURL: imageURL, imageCredit: imageCredit, placeID: placeID)
                
            }
        })

        */
