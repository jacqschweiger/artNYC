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
                               locationName: "Metropolitan Museum of Art",
                               logo: UIImage(named: "placeholder")!,
                               address: "1000 5th Ave",
                               hours: ["Sunday":"10am-5:30pm", "Monday":"10am-5:30pm", "Tuesday":"10am-5:30pm", "Wednesday":"10am-5:30pm", "Thursday":"10am-5:30pm", "Friday":"10am-9pm", "Saturday":"10am-9pm"],
                               ticketPrice: "$25 (suggested)",
                               freeHours: "tbd",
                               artCategories: "European, Modern, Asian, Islamic, African, Ancient",
                               coordinate: CLLocationCoordinate2D(latitude: 40.7794, longitude: -73.9634))
        
//        let neueGalerie = Museum(locationName: "Neue Galerie New York", address: "1048 5th Ave")
//        let rubinMuseum = Museum(locationName: "Rubin Museum of Art", address: "150 W 17th St")
//        let whitney = Museum(locationName: "Whitney Museum of American Art", address: "99 Gansevoort St")
//        let moma = Museum(locationName: "Museum of Modern Art", address: "11 W 53rd St")
//        let guggenheim = Museum(locationName: "Solomon R. Guggenheim Museum", address: "1071 5th Ave")
//        let jewishMuseum = Museum(locationName: "Jewish Museum", address: "1109 5th Ave")
//        let metBreuer = Museum(locationName: "The Met Breuer", address: "945 Madison Ave")
//        let cloisters = Museum(locationName: "The Met Cloisters", address: "99 Margaret Corbin Dr")
//        let drawingCenter = Museum(locationName: "The Drawing Center", address: "35 Wooster St")
//        let frick = Museum(locationName: "The Frick Collection", address: "1 E 70th St")
//        let hispanicSociety = Museum(locationName: "Hispanic Society of America", address: "613 W 155th St")
//        let asiaSociety = Museum(locationName: "Asia Society", address: "725 Park Ave")
//        let mad = Museum(locationName: "The Museum of Arts and Design", address: "2 Columbus Circle")
//        let folkArt = Museum(locationName: "American Folk Art Museum", address: "2 Lincoln Square")
//        let morganLibrary = Museum(locationName: "Morgan Library & Museum", address: "225 Madison Ave")
//        let newMuseum = Museum(locationName: "The New Museum", address: "235 Bowery")
//        let museoDelBarrio = Museum(locationName: "El Museo Del Barrio", address: "1230 5th Ave")
//        let cooperHewitt = Museum(locationName: "Cooper Hewitt", address: "2 E 91st St")
//        let fit = Museum(locationName: "The Museum at FIT", address: "227 W 27th St")
        
//        museums = [metMuseum, neueGalerie, rubinMuseum, whitney, moma, guggenheim, jewishMuseum, metBreuer, cloisters, drawingCenter, frick, hispanicSociety, asiaSociety, mad, folkArt, morganLibrary, newMuseum, museoDelBarrio, cooperHewitt, fit]
        museums = [metMuseum]
    }

    
    
    
}
