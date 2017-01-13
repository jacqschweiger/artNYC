//
//  MuseumDataStore.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/13/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation

class MuseumDataStore {
    
    static let sharedInstance = MuseumDataStore()
    
    var museums: [Museum]!
    
    func createMuseums() {
        let metMuseum = Museum(name: "Metropolitan Museum of Art", address: "1000 5th Ave")
        let neueGalerie = Museum(name: "Neue Galerie New York", address: "1048 5th Ave")
        let rubinMuseum = Museum(name: "Rubin Museum of Art", address: "150 W 17th St")
        
        museums = [metMuseum, neueGalerie, rubinMuseum]
    }
    
    
    
    
    
}
