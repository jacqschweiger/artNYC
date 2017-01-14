//
//  MuseumDataStore.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/13/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MuseumDataStore {
    
    static let sharedInstance = MuseumDataStore()
    
    var museums: [Museum]!
    
    func loadMuseums() {
        let metMuseum = Museum(title:"Metropolitan Museum of Art",
                               logo: UIImage(named: "placeholder")!,
                               address: "1000 5th Ave",
                               hours: ["Sunday":"10am-5:30pm",
                                       "Monday":"10am-5:30pm",
                                       "Tuesday":"10am-5:30pm",
                                       "Wednesday":"10am-5:30pm",
                                       "Thursday":"10am-5:30pm",
                                       "Friday":"10am-9pm",
                                       "Saturday":"10am-9pm"],
                               ticketPrice: "$25 (suggested)",
                               freeHours: "Pay what you will with suggested admission",
                               artCategories: "All cultures and time periods",
                               coordinate: CLLocationCoordinate2D(latitude: 40.7794, longitude: -73.9634),
                               url: "http://www.metmuseum.org/")
        
        let neueGalerie = Museum(title: "Neue Galerie New York",
                                 logo: UIImage(named: "placeholder")!,
                                 address: "1048 5th Ave",
                                 hours: ["Sunday":"11am–6pm",
                                         "Monday":"11am–6pm",
                                         "Tuesday":"Closed",
                                         "Wednesday":"Closed",
                                         "Thursday":"11am–6pm",
                                         "Friday":"10am-9pm",
                                         "Saturday":"11AM–6pm"],
                                 ticketPrice: "$20",
                                 freeHours: "First Friday of every month from 6 to 8 p.m.",
                                 artCategories: "Austrian and German",
                                 coordinate: CLLocationCoordinate2D(latitude: 40.7813, longitude: -73.9603),
                                 url: "http://neuegalerie.org/")
        
        let rubinMuseum = Museum(title: "Rubin Museum of Art",
                                 logo: UIImage(named: "placeholder")!,
                                 address: "150 W 17th St",
                                 hours: ["Sunday":"11AM–6PM",
                                         "Monday":"11AM–5PM",
                                         "Tuesday":"Closed",
                                         "Wednesday":"11AM–9PM",
                                         "Thursday":"11AM–5PM",
                                         "Friday":"11AM–10PM",
                                         "Saturday":"11AM–6PM"],
                                 ticketPrice: "$20",
                                 freeHours: "First Friday of every month from 6 to 8 p.m.",
                                 artCategories: "Austrian and German",
                                 coordinate: CLLocationCoordinate2D(latitude: 40.7400, longitude: -73.9973),
                                 url: "http://rubinmuseum.org/")
        
        let whitney = Museum(title: "Whitney Museum of American Art",
                                 logo: UIImage(named: "placeholder")!,
                                 address: "99 Gansevoort St",
                                 hours: ["Sunday":"10:30AM–6PM",
                                         "Monday":"10:30AM–6PM",
                                         "Tuesday":"Closed",
                                         "Wednesday":"10:30AM–6PM",
                                         "Thursday":"10:30AM–6PM",
                                         "Friday":"10:30AM–10PM",
                                         "Saturday":"10:30AM–10PM"],
                                 ticketPrice: "$25",
                                 freeHours: "None",
                                 artCategories: "American Modern and Contemporary",
                                 coordinate: CLLocationCoordinate2D(latitude: 40.7394, longitude: -74.0092),
                                 url: "http://whitney.org/")
        

//        let moma = Museum(title: "Museum of Modern Art", address: "11 W 53rd St")
//        let guggenheim = Museum(title: "Solomon R. Guggenheim Museum", address: "1071 5th Ave")
//        let jewishMuseum = Museum(title: "Jewish Museum", address: "1109 5th Ave")
//        let metBreuer = Museum(title: "The Met Breuer", address: "945 Madison Ave")
//        let cloisters = Museum(title: "The Met Cloisters", address: "99 Margaret Corbin Dr")
//        let drawingCenter = Museum(title: "The Drawing Center", address: "35 Wooster St")
//        let frick = Museum(title: "The Frick Collection", address: "1 E 70th St")
//        let hispanicSociety = Museum(title: "Hispanic Society of America", address: "613 W 155th St")
//        let asiaSociety = Museum(title: "Asia Society", address: "725 Park Ave")
//        let mad = Museum(title: "The Museum of Arts and Design", address: "2 Columbus Circle")
//        let folkArt = Museum(title: "American Folk Art Museum", address: "2 Lincoln Square")
//        let morganLibrary = Museum(title: "Morgan Library & Museum", address: "225 Madison Ave")
//        let newMuseum = Museum(title: "The New Museum", address: "235 Bowery")
//        let museoDelBarrio = Museum(title: "El Museo Del Barrio", address: "1230 5th Ave")
//        let cooperHewitt = Museum(title: "Cooper Hewitt", address: "2 E 91st St")
//        let fit = Museum(title: "The Museum at FIT", address: "227 W 27th St")
        
//        museums = [metMuseum, neueGalerie, rubinMuseum, whitney, moma, guggenheim, jewishMuseum, metBreuer, cloisters, drawingCenter, frick, hispanicSociety, asiaSociety, mad, folkArt, morganLibrary, newMuseum, museoDelBarrio, cooperHewitt, fit]
        museums = [metMuseum, neueGalerie, rubinMuseum, whitney]
    }

    
    
    
}
