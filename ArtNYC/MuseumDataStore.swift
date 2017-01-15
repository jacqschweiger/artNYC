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
                               logo: UIImage(named: "metLogo")!,
                               address: "1000 5th Ave",
                               hours: ["Sunday":"10am-5:30pm",
                                       "Monday":"10am-5:30pm",
                                       "Tuesday":"10am-5:30pm",
                                       "Wednesday":"10am-5:30pm",
                                       "Thursday":"10am-5:30pm",
                                       "Friday":"10am-9pm",
                                       "Saturday":"10am-9pm"],
                               ticketPrice: "$25 (suggested)",
                               freeHours: "Pay what you wish, everyday",
                               artCategories: "All cultures and time periods",
                               coordinate: CLLocationCoordinate2D(latitude: 40.7802722, longitude: -73.9622221),
                               url: "http://www.metmuseum.org/")
        
        let neueGalerie = Museum(title: "Neue Galerie New York",
                                 logo: UIImage(named: "neueGalerieLogo")!,
                                 address: "1048 5th Ave",
                                 hours: ["Sunday":"11am–6pm",
                                         "Monday":"11am–6pm",
                                         "Tuesday":"Closed",
                                         "Wednesday":"Closed",
                                         "Thursday":"11am–6pm",
                                         "Friday":"10am-9pm",
                                         "Saturday":"11am–6pm"],
                                 ticketPrice: "$20",
                                 freeHours: "First Friday of every month, 6-8pm",
                                 artCategories: "Austrian & German",
                                 coordinate: CLLocationCoordinate2D(latitude: 40.7813, longitude: -73.9603),
                                 url: "http://neuegalerie.org/")
        
        let rubinMuseum = Museum(title: "Rubin Museum of Art",
                                 logo: UIImage(named: "rubinLogo")!,
                                 address: "150 W 17th St",
                                 hours: ["Sunday":"11am–6pm",
                                         "Monday":"11am–5pm",
                                         "Tuesday":"Closed",
                                         "Wednesday":"11am–9pm",
                                         "Thursday":"11am–5pm",
                                         "Friday":"11am–10pm",
                                         "Saturday":"11am–6pm"],
                                 ticketPrice: "$20",
                                 freeHours: "Fridays 6–10pm",
                                 artCategories: "Himalayan & Asian",
                                 coordinate: CLLocationCoordinate2D(latitude: 40.740109, longitude: -73.9977899),
                                 url: "http://rubinmuseum.org/")
        
        let whitney = Museum(title: "Whitney Museum of American Art",
                                 logo: UIImage(named: "whitneyLogo")!,
                                 address: "99 Gansevoort St",
                                 hours: ["Sunday":"10:30am–6pm",
                                         "Monday":"10:30am–6pm",
                                         "Tuesday":"Closed",
                                         "Wednesday":"10:30am–6pm",
                                         "Thursday":"10:30am–6pm",
                                         "Friday":"10:30am–10pm",
                                         "Saturday":"10:30am–10pm"],
                                 ticketPrice: "$25",
                                 freeHours: "None",
                                 artCategories: "American modern & contemporary",
                                 coordinate: CLLocationCoordinate2D(latitude: 40.7396877, longitude: -74.0088928),
                                 url: "http://whitney.org/")
        

        let moma = Museum(title: "Museum of Modern Art",
                          logo: UIImage(named: "momaLogo")!,
                          address: "11 W 53rd St",
                          hours: ["Sunday":"10:30AM–5:30PM",
                                  "Monday":"10:30AM–5:30PM",
                                  "Tuesday":"10:30AM–5:30PM",
                                  "Wednesday":"10:30AM–5:30PM",
                                  "Thursday":"10:30AM–5:30PM",
                                  "Friday":"10:30AM–8PM",
                                  "Saturday":"10:30AM–5:30PM"],
                          ticketPrice: "$25",
                          freeHours: "Fridays, 4-8pm",
                          artCategories: "Modern & contemporary",
                          coordinate: CLLocationCoordinate2D(latitude: 40.7615708, longitude: -73.9773532),
                          url: "https://www.moma.org/")
        
        let guggenheim = Museum(title: "Solomon R. Guggenheim Museum",
                          logo: UIImage(named: "guggenheimLogo")!,
                          address: "1071 5th Ave",
                          hours: ["Sunday":"10AM–5:45PM",
                                  "Monday":"10AM–5:45PM",
                                  "Tuesday":"10AM–5:45PM",
                                  "Wednesday":"10AM–5:45PM",
                                  "Thursday":"Closed",
                                  "Friday":"10AM–5:45PM",
                                  "Saturday":"10AM–7:45PM"],
                          ticketPrice: "$15",
                          freeHours: "Pay what you wish Saturdays, 5:45–7:45pm",
                          artCategories: "Modern & contemporary",
                          coordinate: CLLocationCoordinate2D(latitude: 40.7829473, longitude: -73.959093),
                          url: "https://www.guggenheim.org/")
        
        let jewishMuseum = Museum(title: "Jewish Museum",
                                logo: UIImage(named: "jewishMuseumLogo")!,
                                address: "1109 5th Ave",
                                hours: ["Sunday":"11AM–5:45PM",
                                        "Monday":"11AM–5:45PM",
                                        "Tuesday":"11AM–5:45PM",
                                        "Wednesday":"Closed",
                                        "Thursday":"11AM–8PM",
                                        "Friday":"11AM–4PM",
                                        "Saturday":"11AM–5:45PM"],
                                ticketPrice: "$15",
                                freeHours: "Saturdays free; pay what you wish Thursdays, 5–8pm",
                                artCategories: "Jewish art & artists, contemporary & historic",
                                coordinate: CLLocationCoordinate2D(latitude: 40.7854, longitude: -73.9572),
                                url: "http://thejewishmuseum.org/")
        
        let folkArt = Museum(title: "American Folk Art Museum",
                                  logo: UIImage(named: "folkArtLogo")!,
                                  address: "2 Lincoln Square",
                                  hours: ["Sunday":"12–6PM",
                                          "Monday":"Closed",
                                          "Tuesday":"11:30AM–7PM",
                                          "Wednesday":"11:30AM–7PM",
                                          "Thursday":"11:30AM–7PM",
                                          "Friday":"12–7:30PM",
                                          "Saturday":"11:30AM–7PM"],
                                  ticketPrice: "Free",
                                  freeHours: "Always free",
                                  artCategories: "American folk",
                                  coordinate: CLLocationCoordinate2D(latitude: 40.7732, longitude: -73.9814),
                                  url: "http://folkartmuseum.org/")
        
        let newMuseum = Museum(title: "The New Museum",
                             logo: UIImage(named: "newMuseumLogo")!,
                             address: "235 Bowery",
                             hours: ["Sunday":"11AM–6PM",
                                     "Monday":"Closed",
                                     "Tuesday":"11AM–6PM",
                                     "Wednesday":"11AM–6PM",
                                     "Thursday":"11AM–9PM",
                                     "Friday":"11AM–6PM",
                                     "Saturday":"11AM–6PM"],
                             ticketPrice: "$18",
                             freeHours: "Pay what you wish Thursdays, 7-9pm",
                             artCategories: "Contemporary",
                             coordinate: CLLocationCoordinate2D(latitude: 40.7223779, longitude: -73.993038),
                             url: "http://www.newmuseum.org/")
        
        let museoDelBarrio = Museum(title: "El Museo Del Barrio",
                               logo: UIImage(named: "museoDelBarrioLogo")!,
                               address: "1230 5th Ave",
                               hours: ["Sunday":"12–5PM",
                                       "Monday":"Closed",
                                       "Tuesday":"Closed",
                                       "Wednesday":"11AM–6PM",
                                       "Thursday":"11AM–6PM",
                                       "Friday":"11AM–6PM",
                                       "Saturday":"11AM–6PM"],
                               ticketPrice: "$9",
                               freeHours: "Every third Saturday of the month",
                               artCategories: "Latino, Caribbean, & Latin American",
                               coordinate: CLLocationCoordinate2D(latitude: 40.7931, longitude: -73.9514),
                               url: "http://www.elmuseo.org/")
        
        let mad = Museum(title: "Museum of Arts and Design",
                                    logo: UIImage(named: "madLogo")!,
                                    address: "2 Columbus Circle",
                                    hours: ["Sunday":"10AM–6PM",
                                            "Monday":"Closed",
                                            "Tuesday":"10AM–6PM",
                                            "Wednesday":"10AM–6PM",
                                            "Thursday":"10AM–9PM",
                                            "Friday":"10AM–9PM",
                                            "Saturday":"10AM–6PM"],
                                    ticketPrice: "$16",
                                    freeHours: "Pay what you wish Thursdays, 6-9pm",                                    artCategories: "Craft, art & design, contemporary & historic",
                                    coordinate: CLLocationCoordinate2D(latitude: 40.7674, longitude: -73.9820),
                                    url: "http://www.madmuseum.org/")

//        let cooperHewitt = Museum(title: "Cooper Hewitt", address: "2 E 91st St")
//        let fit = Museum(title: "The Museum at FIT", address: "227 W 27th St")
//        let hispanicSociety = Museum(title: "Hispanic Society of America", address: "613 W 155th St")
        
//        let drawingCenter = Museum(title: "The Drawing Center", address: "35 Wooster St")
//        let frick = Museum(title: "The Frick Collection", address: "1 E 70th St")
//        let asiaSociety = Museum(title: "Asia Society", address: "725 Park Ave")
        
//        let metBreuer = Museum(title: "The Met Breuer", address: "945 Madison Ave")
//        let cloisters = Museum(title: "The Met Cloisters", address: "99 Margaret Corbin Dr")
//        let morganLibrary = Museum(title: "Morgan Library & Museum", address: "225 Madison Ave")

        

        museums = [metMuseum, neueGalerie, rubinMuseum, whitney, moma, guggenheim, jewishMuseum, folkArt, newMuseum, museoDelBarrio, mad]
    }

    
    
    
}
