//
//  Museum.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/13/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class Museum {

    var name: String
    var address: String
    var logo: UIImage
    var coordinates: String
    var hours: [String: String]
    var ticketPrice: String
    var freeHours: String
    var artCategories: String
    
    convenience init(name: String, address: String) {
        self.init(name: name, logo: UIImage(named: "placeholder")!, address: address, coordinates: "0,0", hours: ["0":"0"], ticketPrice: "$0", freeHours: "0", artCategories: "0")
    }
    
    init(name: String, logo: UIImage, address: String, coordinates: String, hours: [String: String], ticketPrice: String, freeHours: String, artCategories: String){
        self.name = name
        self.logo = logo
        self.address = address
        self.coordinates = coordinates
        self.hours = hours
        self.ticketPrice = ticketPrice
        self.freeHours = freeHours
        self.artCategories = artCategories
    }
}
