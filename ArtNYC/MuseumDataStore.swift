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
    private init() {}
    
    var filteredMuseums: [Museum] = []
    var allMuseums: [Museum] = []
    var interiorViewSwitchIsOn: Bool = false
    var freeAdmissionSwitchIsOn: Bool = false
    var openLateSwitchIsOn: Bool = false
    
    
        
    func getHours(with completion: @escaping ()->()) {
        for museum in self.allMuseums {
            GoogleAPIClient.getHours(with: museum.placeID, completion: { (results) in
                museum.hours = results.joined(separator: "\n").replacingOccurrences(of: ":00", with: "").replacingOccurrences(of: " AM", with: "am").replacingOccurrences(of: " PM", with: "pm")
            })
        }
        completion()
        
    }
    
    
}
