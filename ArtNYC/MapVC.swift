//
//  MapVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/13/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import MapKit

class MapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var store = MuseumDataStore.sharedInstance
    let regionRadius: CLLocationDistance = 1500
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            let initialLocation = CLLocation(latitude: 40.7829, longitude: -73.9654)
            self.centerMapOnLocation(location: initialLocation)
        }
        
        mapView.addAnnotation(store.museums[0])
        
    }
    
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
}
