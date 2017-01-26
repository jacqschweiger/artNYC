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

class MuseumDataStore {
    
    static let sharedInstance = MuseumDataStore()
    
    var museums: [Museum]!
    var placeID: String!
    var photoReference: String!
    var photoURL: String!
    
    
    func loadMuseums() {
        let metMuseum = Museum(title:"The Metropolitan Museum of Art",
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
                               url: "http://www.metmuseum.org/",
                               interiorMapView: true,
                               photoURL: "")
        
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
                                 url: "http://neuegalerie.org/",
                                 interiorMapView: false,
                                 photoURL: "")
        
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
                                 url: "http://rubinmuseum.org/",
                                 interiorMapView: true,
                                 photoURL: "")
        
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
                             url: "http://whitney.org/",
                             interiorMapView: false,
                             photoURL: "")
        
        
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
                          url: "https://www.moma.org/",
                          interiorMapView: true,
                          photoURL: "")
        
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
                                url: "https://www.guggenheim.org/",
                                interiorMapView: true,
                                photoURL: "")
        
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
                                  freeHours: "Saturdays free\nPay what you wish Thursdays, 5–8pm",
                                  artCategories: "Jewish art & artists, contemporary & historic",
                                  coordinate: CLLocationCoordinate2D(latitude: 40.7854, longitude: -73.9572),
                                  url: "http://thejewishmuseum.org/",
                                  interiorMapView: false,
                                  photoURL: "")
        
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
                             url: "http://folkartmuseum.org/",
                             interiorMapView: false,
                             photoURL: "")
        
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
                               url: "http://www.newmuseum.org/",
                               interiorMapView: false,
                               photoURL: "")
        
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
                                    url: "http://www.elmuseo.org/",
                                    interiorMapView: false,
                                    photoURL: "")
        
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
                         url: "http://www.madmuseum.org/",
                         interiorMapView: false,
                         photoURL: "")
        
        let cooperHewitt = Museum(title: "Cooper Hewitt",
                                  logo: UIImage(named: "cooperHewittLogo")!,
                                  address: "2 E 91st St",
                                  hours: ["Sunday":"10AM–6PM",
                                          "Monday":"10AM–6PM",
                                          "Tuesday":"10AM–6PM",
                                          "Wednesday":"10AM–6PM",
                                          "Thursday":"10AM–6PM",
                                          "Friday":"10AM–6PM",
                                          "Saturday":"10AM–9PM"],
                                  ticketPrice: "$18",
                                  freeHours: "Pay what you wish Saturdays, 6-9pm",                                    artCategories: "Design",
                                  coordinate: CLLocationCoordinate2D(latitude: 40.7844391, longitude: -73.9578551),
                                  url: "https://www.cooperhewitt.org/",
                                  interiorMapView: false,
                                  photoURL: "")
        
        let frick = Museum(title: "The Frick Collection",
                           logo: UIImage(named: "frickLogo")!,
                           address: "1 E 70th St",
                           hours: ["Sunday":"11AM–5PM",
                                   "Monday":"Closed",
                                   "Tuesday":"10AM–6PM",
                                   "Wednesday":"10AM–6PM",
                                   "Thursday":"10AM–6PM",
                                   "Friday":"10AM–6PM",
                                   "Saturday":"10AM–6PM"],
                           ticketPrice: "$22",
                           freeHours: "First Friday of every month, 6-9pm",
                           artCategories: "Old Masters, European decorative",
                           coordinate: CLLocationCoordinate2D(latitude: 40.7710473, longitude: -73.9673473),
                           url: "http://www.frick.org/",
                           interiorMapView: true,
                           photoURL: "")
        
        let drawingCenter = Museum(title: "The Drawing Center",
                                   logo: UIImage(named: "drawingCenterLogo")!,
                                   address: "35 Wooster St",
                                   hours: ["Sunday":"12–6PM",
                                           "Monday":"Closed",
                                           "Tuesday":"Closed",
                                           "Wednesday":"12–6PM",
                                           "Thursday":"12–8PM",
                                           "Friday":"12–6PM",
                                           "Saturday":"12–6PM"],
                                   ticketPrice: "$5",
                                   freeHours: "Thursdays, 6–8pm",
                                   artCategories: "Works on paper",
                                   coordinate: CLLocationCoordinate2D(latitude: 40.7223326, longitude: -74.0026948),
                                   url: "http://www.drawingcenter.org/",
                                   interiorMapView: false,
                                   photoURL: "")
        
        let cloisters = Museum(title: "The Met Cloisters",
                               logo: UIImage(named: "cloistersLogo")!,
                               address: "99 Margaret Corbin Dr",
                               hours: ["Sunday":"10AM–4:45PM",
                                       "Monday":"10AM–4:45PM",
                                       "Tuesday":"10AM–4:45PM",
                                       "Wednesday":"10AM–4:45PM",
                                       "Thursday":"10AM–4:45PM",
                                       "Friday":"10AM–4:45PM",
                                       "Saturday":"10AM–4:45PM"],
                               ticketPrice: "$25 (suggested)",
                               freeHours: "Pay what you wish, everyday",                               artCategories: "Medieval",
                               coordinate: CLLocationCoordinate2D(latitude: 40.8652285, longitude: -73.9310879),
                               url: "http://www.metmuseum.org/visit/met-cloisters",
                               interiorMapView: false,
                               photoURL: "")
        
        let hispanicSociety = Museum(title: "Hispanic Society of America",
                                     logo: UIImage(named: "hispanicSocietyLogo")!,
                                     address: "613 W 155th St",
                                     hours: ["Sunday":"1–4PM",
                                             "Monday":"Closed",
                                             "Tuesday":"10AM–4:30PM",
                                             "Wednesday":"10AM–4:30PM",
                                             "Thursday":"10AM–4:30PM",
                                             "Friday":"10AM–4:30PM",
                                             "Saturday":"10AM–4:30PM"],
                                     ticketPrice: "Free",
                                     freeHours: "Always free",
                                     artCategories: "Spanish & Portuguese",
                                     coordinate: CLLocationCoordinate2D(latitude: 40.8333768, longitude: -73.9470945),
                                     url: "http://hispanicsociety.org/",
                                     interiorMapView: false,
                                     photoURL: "")
        
        let metBreuer = Museum(title: "The Met Breuer",
                               logo: UIImage(named: "breuerLogo")!,
                               address: "945 Madison Ave",
                               hours: ["Sunday":"10AM–5:30PM",
                                       "Monday":"Closed",
                                       "Tuesday":"10AM–5:30PM",
                                       "Wednesday":"10AM–5:30PM",
                                       "Thursday":"10AM–5:30PM",
                                       "Friday":"10AM–9PM",
                                       "Saturday":"10AM–9PM"],
                               ticketPrice: "$25 (suggested)",
                               freeHours: "Pay what you wish, everyday",
                               artCategories: "Modern & contemporary",
                               coordinate: CLLocationCoordinate2D(latitude: 40.7735936, longitude: -73.9641533),
                               url: "http://www.metmuseum.org/visit/met-breuer",
                               interiorMapView: false,
                               photoURL: "")
        
        let asiaSociety = Museum(title: "Asia Society",
                                 logo: UIImage(named: "asiaLogo")!,
                                 address: "725 Park Ave",
                                 hours: ["Sunday":"11AM–6PM",
                                         "Monday":"Closed",
                                         "Tuesday":"11AM–6PM",
                                         "Wednesday":"11AM–6PM",
                                         "Thursday":"11AM–6PM",
                                         "Friday":"11AM–9PM",
                                         "Saturday":"11AM–6PM"],
                                 ticketPrice: "$12",
                                 freeHours: "Fridays, 6-9pm",
                                 artCategories: "Asian",
                                 coordinate: CLLocationCoordinate2D(latitude: 40.7700221, longitude: -73.9645825),
                                 url: "http://asiasociety.org/museum",
                                 interiorMapView: false,
                                 photoURL: "")
        
        let fit = Museum(title: "The Museum at FIT",
                         logo: UIImage(named: "fitLogo")!,
                         address: "227 W 27th St",
                         hours: ["Sunday":"Closed",
                                 "Monday":"Closed",
                                 "Tuesday":"12–8PM",
                                 "Wednesday":"12–8PM",
                                 "Thursday":"12–8PM",
                                 "Friday":"12–8PM",
                                 "Saturday":"10AM–5PM"],
                         ticketPrice: "Free",
                         freeHours: "Always free",
                         artCategories: "Fashion",
                         coordinate: CLLocationCoordinate2D(latitude: 40.7464981, longitude: -73.993782),
                         url: "http://www.fitnyc.edu/museum/",
                         interiorMapView: false,
                         photoURL: "")
        
        let morganLibrary = Museum(title: "Morgan Library & Museum",
                                   logo: UIImage(named: "morganLogo")!,
                                   address: "225 Madison Ave",
                                   hours: ["Sunday":"Closed",
                                           "Monday":"Closed",
                                           "Tuesday":"12–8PM",
                                           "Wednesday":"12–8PM",
                                           "Thursday":"12–8PM",
                                           "Friday":"12–8PM",
                                           "Saturday":"10AM–5PM"],
                                   ticketPrice: "$20",
                                   freeHours: "Fridays, 7-9pm",
                                   artCategories: "Rare books, music, drawings",
                                   coordinate: CLLocationCoordinate2D(latitude: 40.7494742, longitude: -73.9817367),
                                   url: "http://www.themorgan.org/",
                                   interiorMapView: false,
                                   photoURL: "")
        
        museums = [metMuseum, rubinMuseum, frick, moma, guggenheim, neueGalerie, whitney, jewishMuseum, folkArt, newMuseum, museoDelBarrio, mad, cooperHewitt, drawingCenter, cloisters, hispanicSociety, metBreuer, asiaSociety, fit, morganLibrary]
        
        museums = self.museums.sorted { (museum1, museum2) -> Bool in
            return museum1.title! < museum2.title!
        }
        
    }
    
    func getMuseums(){
        
        print("getting museums")
        
        self.loadMuseums()
        
        print("entering get images func")
        
        for museum in self.museums {
            guard let museumTitle = museum.title?.replacingOccurrences(of: " ", with: "+") else { return }
            
            getPlaceIDFromAPI(with: museumTitle, completion: {
                print("placeId: \(self.placeID)")
                self.getPhotoReferenceFromAPI {
                    print("placeId: \(self.placeID)")
                    print(museumTitle)
                    
                    guard let photoReference = self.photoReference else { return }
                    
                    print(photoReference)
                    
                    museum.photoURL = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=\(photoReference)&key=\(Constants.key2)"
                    
                    print("url//////////// \(museum.photoURL)\n\n\n\n\n\n\n\n")
                }
            })
        }
    }
    
    // MARK: API Functions
    
    func getPlaceIDFromAPI(with museumTitle: String, completion: @escaping ()->()) {
        PhotosAPIClient.getPlaceID(with: museumTitle) { (results) in
            let newResults = results[0]
            self.placeID = newResults["place_id"] as! String
            completion()
        }
    }
    
    func getPhotoReferenceFromAPI(completion: @escaping ()->()) {
        guard let placeID = self.placeID else { return }
        PhotosAPIClient.getPhotoReference(with: placeID) { (results) in
            let photos = results["photos"] as! [[String: Any]]
            let photoDetails = photos[0]
            self.photoReference = photoDetails["photo_reference"] as! String!
            completion()
        }
    }
    
    
    
    // TODO: - add Noguchi Museum, Museum of the Moving Image, Brooklyn Museum
    
}
