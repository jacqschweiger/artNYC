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
    
    var filteredMuseums: [Museum] = []
    var allMuseums: [Museum] = []
    var interiorViewSwitchIsOn: Bool = false
    var freeAdmissionSwitchIsOn: Bool = false
    var openLateSwitchIsOn: Bool = false
    
    func loadMuseums() {
        let metMuseum = Museum(title: "Metropolitan Museum of Art",
                               logo: UIImage(named: "metLogo")!,
                               address: "1000 5th Ave",
                               hours: "",
                               ticketPrice: "$25 (suggested)",
                               freeHours: "Pay what you wish, everyday",
                               freeDay: [1,2,3,4,5,6,7],
                               artCategories: "All cultures and time periods",
                               coordinate: CLLocationCoordinate2D(latitude: 40.7802722, longitude: -73.9622221),
                               url: "http://www.metmuseum.org/",
                               interiorMapView: true,
                               openLate: true,
                               freeAdmission: true,
                               imageURL: "http://images.metmuseum.org/CRDImages/ep/web-large/DT48.jpg",
                               imageCredit: "Claude Monet. Garden at Sainte-Adresse, 1867. Courtesy the Metropolitan Museum of Art.",
                               placeID: "ChIJb8Jg9pZYwokR-qHGtvSkLzs")
        
        let neueGalerie = Museum(title: "Neue Galerie New York",
                                 logo: UIImage(named: "neueGalerieLogo")!,
                                 address: "1048 5th Ave",
                                 hours: "",
                                 ticketPrice: "$20",
                                 freeHours: "First Friday of month, 6-8pm",
                                 freeDay: [6],
                                 artCategories: "Austrian & German",
                                 coordinate: CLLocationCoordinate2D(latitude: 40.7813, longitude: -73.9603),
                                 url: "http://neuegalerie.org/",
                                 interiorMapView: false,
                                 openLate: true,
                                 freeAdmission: true,
                                 imageURL: "http://www.neuegalerie.org/sites/default/files/adele_new.jpg",
                                 imageCredit: "Gustav Klimt. Adele Bloch-Bauer I, 1907. Courtesy the Neue Galerie.",
                                 placeID: "ChIJ01_9-ZdYwokRL2JrA28GJp8")
        
        let rubinMuseum = Museum(title: "Rubin Museum of Art",
                                 logo: UIImage(named: "rubinLogo")!,
                                 address: "150 W 17th St",
                                 hours: "",
                                 ticketPrice: "$20",
                                 freeHours: "Fridays 6–10pm",
                                 freeDay: [6],
                                 artCategories: "Himalayan & Asian",
                                 coordinate: CLLocationCoordinate2D(latitude: 40.740109, longitude: -73.9977899),
                                 url: "http://rubinmuseum.org/",
                                 interiorMapView: true,
                                 openLate: true,
                                 freeAdmission: true,
                                 imageURL: "http://rubinmuseum.org/images/content/3591/web_c2013.9a-c_front_lg__slider.jpg",
                                 imageCredit: "Tibetan artist. Manjushri Namasamgiti, 19th cent. Courtesy the Rubin Museum of Art.",
                                 placeID: "ChIJD4QSVbxZwokRaFPDajZtIaI")
        
        let whitney = Museum(title: "Whitney Museum of American Art",
                             logo: UIImage(named: "whitneyLogo")!,
                             address: "99 Gansevoort St",
                             hours: "",
                             ticketPrice: "$25",
                             freeHours: "None",
                             freeDay: [],
                             artCategories: "American modern & contemporary",
                             coordinate: CLLocationCoordinate2D(latitude: 40.7396877, longitude: -74.0088928),
                             url: "http://whitney.org/",
                             interiorMapView: false,
                             openLate: true,
                             freeAdmission: false,
                             imageURL: "http://collectionimages.whitney.org/standard/171665/largepage.jpg",
                             imageCredit: "Willem de Kooning. Woman and Bicycle, 1952-53. Courtesy the Whitney Museum of American Art.",
                             placeID:"ChIJN3MJ6pRYwokRiXg91flSP8Y")
        
        
        let moma = Museum(title: "Museum of Modern Art",
                          logo: UIImage(named: "momaLogo")!,
                          address: "11 W 53rd St",
                          hours: "",
                          ticketPrice: "$25",
                          freeHours: "Fridays, 4-8pm",
                          freeDay: [6],
                          artCategories: "Modern & contemporary",
                          coordinate: CLLocationCoordinate2D(latitude: 40.7615708, longitude: -73.9773532),
                          url: "https://www.moma.org/",
                          interiorMapView: true,
                          openLate: true,
                          freeAdmission: true,
                          imageURL: "https://www.moma.org/media/W1siZiIsIjE1MTI3MSJdLFsicCIsImNvbnZlcnQiLCItcmVzaXplIDEzNjZ4MTM2Nlx1MDAzZSJdXQ.jpg?sha=0aeee086f50d61a0",
                          imageCredit: "Pablo Picasso. Les Demoiselles d'Avignon, 1907. Courtesy the Museum of Modern Art.",
                          placeID: "ChIJKxDbe_lYwokRVf__s8CPn-o")
        
        let guggenheim = Museum(title: "Solomon R. Guggenheim Museum",
                                logo: UIImage(named: "guggenheimLogo")!,
                                address: "1071 5th Ave",
                                hours: "",
                                ticketPrice: "$15",
                                freeHours: "Pay what you wish Saturdays, 5:45–7:45pm",
                                freeDay: [7],
                                artCategories: "Modern & contemporary",
                                coordinate: CLLocationCoordinate2D(latitude: 40.7829473, longitude: -73.959093),
                                url: "https://www.guggenheim.org/",
                                interiorMapView: true,
                                openLate: false,
                                freeAdmission: true,
                                imageURL: "https://i0.wp.com/www.guggenheim.org/wp-content/uploads/1913/01/37.244_ph_web.jpg?w=870",
                                imageCredit: "Vasily Kandinsky. Light Picture (Helles Bild), 1913. Courtesy the Solomon R. Guggenheim Museum.",
                                placeID: "ChIJmZ5emqJYwokRuDz79o0coAQ")
        
        let jewishMuseum = Museum(title: "Jewish Museum",
                                  logo: UIImage(named: "jewishMuseumLogo")!,
                                  address: "1109 5th Ave",
                                  hours: "",
                                  ticketPrice: "$15",
                                  freeHours: "Saturdays free\nPay what you wish Thursdays, 5–8pm",
                                  freeDay: [5, 7],
                                  artCategories: "Jewish art & artists, contemporary & historic",
                                  coordinate: CLLocationCoordinate2D(latitude: 40.7854, longitude: -73.9572),
                                  url: "http://thejewishmuseum.org/",
                                  interiorMapView: false,
                                  openLate: true,
                                  freeAdmission: true,
                                  imageURL: "http://72.32.137.209/piction/ump.show_public_image?v_umo=12805126&quality=O3",
                                  imageCredit: "Sol LeWitt. Designed from Torah Ark, 2001. Courtesy the Jewish Museum.",
                                  placeID: "ChIJxY5cO6JYwokRPeVk85UNj2g")
        
        let folkArt = Museum(title: "American Folk Art Museum",
                             logo: UIImage(named: "folkArtLogo")!,
                             address: "2 Lincoln Square",
                             hours: "",
                             ticketPrice: "Free",
                             freeHours: "Always free",
                             freeDay: [1,2,3,4,5,6,7],
                             artCategories: "American folk",
                             coordinate: CLLocationCoordinate2D(latitude: 40.7732, longitude: -73.9814),
                             url: "http://folkartmuseum.org/",
                             interiorMapView: false,
                             openLate: false,
                             freeAdmission: true,
                             imageURL: "http://folkartmuseum.org/content/uploads/2014/08/folk_6649_image.jpg",
                             imageCredit: "Unidentified artist. Soldier’s Quilt, 1854–1890. Courtesy the American Folk Art Museum.",
                             placeID: "ChIJEeD6FPVYwokRgs0ZbWMrrzk")
        
        let newMuseum = Museum(title: "New Museum",
                               logo: UIImage(named: "newMuseumLogo")!,
                               address: "235 Bowery",
                               hours: "",
                               ticketPrice: "$18",
                               freeHours: "Pay what you wish Thursdays, 7-9pm",
                               freeDay: [5],
                               artCategories: "Contemporary",
                               coordinate: CLLocationCoordinate2D(latitude: 40.7223779, longitude: -73.993038),
                               url: "http://www.newmuseum.org/",
                               interiorMapView: false,
                               openLate: true,
                               freeAdmission: true,
                               imageURL: "http://ca.newmuseum.org/media/newmuseum/images/9/1/88974_ca_object_representations_media_9191_mediumlarge.jpg",
                               imageCredit: "Rosemarie Trockel. Exhibition view of Rosemarie Trockel: A Cosmos, 2012-2013.  Photography credit: Benoit Pailley. Courtesy the New Museum.",
                               placeID: "ChIJlaRS3IVZwokR2llMD6dCt-U")
        
        let museoDelBarrio = Museum(title: "El Museo Del Barrio",
                                    logo: UIImage(named: "museoDelBarrioLogo")!,
                                    address: "1230 5th Ave",
                                    hours: "",
                                    ticketPrice: "$9",
                                    freeHours: "Every third Saturday of the month",
                                    freeDay: [7],
                                    artCategories: "Latino, Caribbean, & Latin American",
                                    coordinate: CLLocationCoordinate2D(latitude: 40.7931, longitude: -73.9514),
                                    url: "http://www.elmuseo.org/",
                                    interiorMapView: false,
                                    openLate: false,
                                    freeAdmission: true,
                                    imageURL: "http://www.latinolife.com/wp-content/uploads/2015/05/435_MuseoTaino.jpg",
                                    imageCredit: "Taino artist. Untitled, Pre-Columbian. Courtesy El Museo del Barrio.",
                                    placeID: "ChIJWT0gUBz2wokRNcAxVUphAAs")
        
        let mad = Museum(title: "Museum of Arts and Design",
                         logo: UIImage(named: "madLogo")!,
                         address: "2 Columbus Circle",
                         hours: "",
                         ticketPrice: "$16",
                         freeHours: "Pay what you wish Thursdays, 6-9pm",
                         freeDay: [5],
                         artCategories: "Craft, art & design, contemporary & historic",
                         coordinate: CLLocationCoordinate2D(latitude: 40.7674, longitude: -73.9820),
                         url: "http://www.madmuseum.org/",
                         interiorMapView: false,
                         openLate: true,
                         freeAdmission: true,
                         imageURL: "http://66.223.50.254/emuseum/media/full/2010_42_1.jpg",
                         imageCredit: "Sarah Abramson. Volume 9 (large bun), 2009. Photography credit: Adam Krauth. Courtesy the Museum of Arts and Design.",
                         placeID: "ChIJgVtmM_ZYwokRcJJnebe5KX8")
        
        let cooperHewitt = Museum(title: "Cooper Hewitt",
                                  logo: UIImage(named: "cooperHewittLogo")!,
                                  address: "2 E 91st St",
                                  hours: "",
                                  ticketPrice: "$18",
                                  freeHours: "Pay what you wish Saturdays, 6-9pm",
                                  freeDay: [7],
                                  artCategories: "Design",
                                  coordinate: CLLocationCoordinate2D(latitude: 40.7844391, longitude: -73.9578551),
                                  url: "https://www.cooperhewitt.org/",
                                  interiorMapView: false,
                                  openLate: true,
                                  freeAdmission: true,
                                  imageURL: "https://images.collection.cooperhewitt.org/65247_a6ebf9a09328e38d_b.jpg",
                                  imageCredit: "Marcel Breuer. Long Chair, 1936. Courtesy Cooper Hewitt.",
                                  placeID: "ChIJsT8qSaJYwokR-m20OGJUKCA")
        
        let frick = Museum(title: "Frick Collection",
                           logo: UIImage(named: "frickLogo")!,
                           address: "1 E 70th St",
                           hours: "",
                           ticketPrice: "$22",
                           freeHours: "Free first Friday of month, 6-9pm\nPay what you wish Sundays, 11am-1pm",
                           freeDay: [6, 1],
                           artCategories: "Old Masters, European decorative",
                           coordinate: CLLocationCoordinate2D(latitude: 40.7710473, longitude: -73.9673473),
                           url: "http://www.frick.org/",
                           interiorMapView: true,
                           openLate: false,
                           freeAdmission: true,
                           imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Fran%C3%A7ois_Boucher_020.jpg/734px-Fran%C3%A7ois_Boucher_020.jpg",
                           imageCredit: "François Boucher. A Lady on Her Day Bed, 1743. Courtesy the Frick Collection.",
                           placeID: "ChIJHRH97uxYwokR6CBeDyn1jtg")
        
        let drawingCenter = Museum(title: "Drawing Center",
                                   logo: UIImage(named: "drawingCenterLogo")!,
                                   address: "35 Wooster St",
                                   hours: "",
                                   ticketPrice: "$5",
                                   freeHours: "Thursdays, 6–8pm",
                                   freeDay: [5],
                                   artCategories: "Works on paper",
                                   coordinate: CLLocationCoordinate2D(latitude: 40.7223326, longitude: -74.0026948),
                                   url: "http://www.drawingcenter.org/",
                                   interiorMapView: false,
                                   openLate: true,
                                   freeAdmission: true,
                                   imageURL: "http://www.drawingcenter.org/files/a5977133e2fc65e1a662f75ef662dda0eb0b36d6.jpg",
                                   imageCredit: "Cecily Brown. Strolling Actresses (After Hogarth), 2015. Courtesy the Drawing Center.",
                                   placeID: "ChIJDTWukItZwokREUciPmdlVy0")
        
        let cloisters = Museum(title: "Met Cloisters",
                               logo: UIImage(named: "cloistersLogo")!,
                               address: "99 Margaret Corbin Dr",
                               hours: "",
                               ticketPrice: "$25 (suggested)",
                               freeHours: "Pay what you wish, everyday",
                               freeDay: [1,2,3,4,5,6,7],
                               artCategories: "Medieval",
                               coordinate: CLLocationCoordinate2D(latitude: 40.8652285, longitude: -73.9310879),
                               url: "http://www.metmuseum.org/visit/met-cloisters",
                               interiorMapView: false,
                               openLate: false,
                               freeAdmission: true,
                               imageURL: "http://images.metmuseum.org/CRDImages/cl/web-large/DP273206.jpg",
                               imageCredit: "Workshop of Robert Campin. Annunciation Triptych (Merode Altarpiece), 1427–32. Courtesy the Metropolitan Museum of Art.",
                               placeID: "ChIJK6bycAH0wokRrSnflfrnkZE")
        
        let hispanicSociety = Museum(title: "Hispanic Society of America",
                                     logo: UIImage(named: "hispanicSocietyLogo")!,
                                     address: "613 W 155th St",
                                     hours: "Temporarily closed",
                                     ticketPrice: "Free",
                                     freeHours: "Always free",
                                     freeDay: [1,2,3,4,5,6,7],
                                     artCategories: "Spanish & Portuguese",
                                     coordinate: CLLocationCoordinate2D(latitude: 40.8333768, longitude: -73.9470945),
                                     url: "http://hispanicsociety.org/",
                                     interiorMapView: false,
                                     openLate: false,
                                     freeAdmission: true,
                                     imageURL: "http://www.learn.columbia.edu/hispanic/img/art400/velazquez-girl.jpg",
                                     imageCredit: "Diego Velázquez. Portrait of a Little Girl, ca. 1638-44. Courtesy the Hispanic Society of America.",
                                     placeID: "ChIJv9uJC4b2wokRI7r1wOp3AHw")
        
        let metBreuer = Museum(title: "Met Breuer",
                               logo: UIImage(named: "breuerLogo")!,
                               address: "945 Madison Ave",
                               hours: "",
                               ticketPrice: "$25 (suggested)",
                               freeHours: "Pay what you wish, everyday",
                               freeDay: [1,2,3,4,5,6,7],
                               artCategories: "Modern & contemporary",
                               coordinate: CLLocationCoordinate2D(latitude: 40.7735936, longitude: -73.9641533),
                               url: "http://www.metmuseum.org/visit/met-breuer",
                               interiorMapView: false,
                               openLate: true,
                               freeAdmission: true,
                               imageURL: "http://images.metmuseum.org/CRDImages/ma/web-large/DP362047.jpg",
                               imageCredit: "Kerry James Marshall. Untitled (Studio), 2014. Courtesy the Metropolitan Museum of Art.",
                               placeID: "ChIJl-WU6pRYwokRA91OgdYWfa4")
        
        let asiaSociety = Museum(title: "Asia Society",
                                 logo: UIImage(named: "asiaLogo")!,
                                 address: "725 Park Ave",
                                 hours: "",
                                 ticketPrice: "$12",
                                 freeHours: "Fridays, 6-9pm",
                                 freeDay: [6],
                                 artCategories: "Asian",
                                 coordinate: CLLocationCoordinate2D(latitude: 40.7700221, longitude: -73.9645825),
                                 url: "http://asiasociety.org/museum",
                                 interiorMapView: false,
                                 openLate: true,
                                 freeAdmission: true,
                                 imageURL: "http://asiasociety.org/museum/collection_media/h640/imported/1979.219-view-a.jpg",
                                 imageCredit: "Kitagawa Utamaro. The Light-Hearted Type (Uwaki No Sō), From The Series Ten Studies In Female Physiognomy (Fujin Sogaku Juttai), 1791-1793. Courtesy Asia Society Museum.",
                                 placeID: "ChIJeXQWdutYwokRuHX2h1so5K4")
        
        let fit = Museum(title: "Museum at FIT",
                         logo: UIImage(named: "fitLogo")!,
                         address: "227 W 27th St",
                         hours: "",
                         ticketPrice: "Free",
                         freeHours: "Always free",
                         freeDay: [1,2,3,4,5,6,7],
                         artCategories: "Fashion",
                         coordinate: CLLocationCoordinate2D(latitude: 40.7464981, longitude: -73.993782),
                         url: "http://www.fitnyc.edu/museum/",
                         interiorMapView: false,
                         openLate: true,
                         freeAdmission: true,
                         imageURL: "http://www.fitnyc.edu/museum/images/ue-black-fashion-designers-92.105.8-300.jpg",
                         imageCredit: "Stephen Burrows. Coatdress, Fall 1970. Courtesy the Museum at FIT.",
                         placeID: "ChIJzT4qRatZwokRELNiRd8Su_4")
        
        let morganLibrary = Museum(title: "Morgan Library & Museum",
                                   logo: UIImage(named: "morganLogo")!,
                                   address: "225 Madison Ave",
                                   hours: "",
                                   ticketPrice: "$20",
                                   freeHours: "Fridays, 7-9pm",
                                   freeDay: [6],
                                   artCategories: "Rare books, music, drawings",
                                   coordinate: CLLocationCoordinate2D(latitude: 40.7494742, longitude: -73.9817367),
                                   url: "http://www.themorgan.org/",
                                   interiorMapView: false,
                                   openLate: true,
                                   freeAdmission: true,
                                   imageURL: "http://www.themorgan.org/sites/default/files/styles/collection_image/public/images/collection/m638_23v_0.jpg?itok=Qhu82zYG",
                                   imageCredit: "Unidentified artist. Saul Slaying Nahash and the Ammonites; Samuel Anoints Saul and Sacrifices to the Lord, ca. 1240. Courtesy the Morgan Library & Museum.",
                                   placeID: "ChIJ3453OAdZwokRja92OOKCugM")
        
        let brooklyn = Museum(title: "Brooklyn Museum",
                                   logo: UIImage(named: "brooklynLogo")!,
                                   address: "200 Eastern Pkwy",
                                   hours: "",
                                   ticketPrice: "$16 (suggested)",
                                   freeHours: "Pay what you wish everyday\nFree first Saturday of month, 5-11pm",
                                   freeDay: [1,2,3,4,5,6,7],
                                   artCategories: "All cultures and time periods",
                                   coordinate: CLLocationCoordinate2D(latitude: 40.6712102, longitude: -73.9658246),
                                   url: "https://www.brooklynmuseum.org/",
                                   interiorMapView: false,
                                   openLate: true,
                                   freeAdmission: true,
                                   imageURL: "https://d1lfxha3ugu3d4.cloudfront.net/images/opencollection/objects/size2/2015.53_framed_PS2.jpg",
                                   imageCredit: "Kehinde Wiley. Napoleon Leading the Army over the Alps, 2005. Courtesy the Brooklyn Museum.",
                                   placeID: "ChIJyTmcRApbwokR-oXJRqpVI8Y")
        
        let momaPS1 = Museum(title: "MoMA PS1",
                              logo: UIImage(named: "momaPS1Logo")!,
                              address: "22-25 Jackson Ave",
                              hours: "",
                              ticketPrice: "$10 (suggested)",
                              freeHours: "Pay what you wish everyday",
                              freeDay: [1,2,3,4,5,6,7],
                              artCategories: "Contemporary",
                              coordinate: CLLocationCoordinate2D(latitude: 40.7454941, longitude: -73.9495512),
                              url: "http://momaps1.org/",
                              interiorMapView: false,
                              openLate: true,
                              freeAdmission: true,
                              imageURL: "http://momaps1.org/images/home/2016/2016_rockaway.jpg",
                              imageCredit: "Katharina Grosse. Rockaway!, 2016. Courtesy the MoMA PS1.",
                              placeID: "ChIJwfbFiiNZwokRN8hnF940DbY")
        
        let noguchi = Museum(title: "Noguchi Museum",
                             logo: UIImage(named: "noguchiLogo")!,
                             address: "22-25 Jackson Ave",
                             hours: "",
                             ticketPrice: "$10",
                             freeHours: "First Friday of month",
                             freeDay: [6],
                             artCategories: "Sculpture",
                             coordinate: CLLocationCoordinate2D(latitude: 40.7670215, longitude: -73.9376379),
                             url: "http://www.noguchi.org/",
                             interiorMapView: true,
                             openLate: false,
                             freeAdmission: true,
                             imageURL: "http://www.noguchi.org/sites/default/files/imagecache/main_collection_image/collection/730A.jpg",
                             imageCredit: "Isamu Noguchi. Sun at Midnight, 1973. Courtesy the Isamu Noguchi Foundation and Garden Museum.",
                             placeID: "ChIJUZ0c7MpYwokRh8SiMzCXL98")
        
        let queens = Museum(title: "Queens Museum",
                             logo: UIImage(named: "queensLogo")!,
                             address: "Flushing Meadows Corona Park",
                             hours: "",
                             ticketPrice: "$8",
                             freeHours: "None",
                             freeDay: [],
                             artCategories: "Contemporary and New York-related",
                             coordinate: CLLocationCoordinate2D(latitude: 40.7459436, longitude: -73.8489266),
                             url: "http://www.queensmuseum.org/",
                             interiorMapView: false,
                             openLate: false,
                             freeAdmission: true,
                             imageURL: "http://www.queensmuseum.org/wp-content/uploads/2013/11/Exhibitions_Panorama_Chrysler-Building-on-the-Panorama-638x319.png",
                             imageCredit: "Panorama of the City of New York, 1964. Courtesy the Queens Museum.",
                             placeID: "ChIJmWMJBtBfwokR5qK7waLcgAM")
        
        allMuseums = [metMuseum, rubinMuseum, frick, moma, guggenheim, neueGalerie, whitney, jewishMuseum, folkArt, newMuseum, museoDelBarrio, mad, cooperHewitt, drawingCenter, cloisters, metBreuer, fit, morganLibrary, asiaSociety, brooklyn, momaPS1, noguchi, queens]
        
        // TODO: - add Museum of the Moving Image, Photo Center, Queens
        
        allMuseums = self.allMuseums.sorted { (museum1, museum2) -> Bool in
            return museum1.title! < museum2.title!
        }
        
        getHours {
            print("called get hours")
        }
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
