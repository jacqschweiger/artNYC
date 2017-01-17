//
//  MapVC.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 1/13/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import GoogleMaps

class MapVC: UIViewController, GMSMapViewDelegate {
    
    var store = MuseumDataStore.sharedInstance
    var selectedMuseum: Museum?
    var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 40.784, longitude: -73.9654, zoom: 12)
        self.mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        self.view = mapView
        mapView.delegate = self
        mapView.isMyLocationEnabled = false
        
        addLocations()
        
    }
    
    func addLocations(){
        for museum in store.museums {
            let position = museum.coordinate
            let marker = GMSMarker(position: position)
            if let museumTitle = museum.title {
                marker.title = museumTitle
            }
            marker.snippet = "See more"
            marker.map = mapView
        }
        
    }

    
    
    // MARK: GMSMapViewDelegate
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        for museum in store.museums {
            if museum.title == marker.title {
                self.selectedMuseum = museum
            }
        }
        performSegue(withIdentifier: "showMuseum", sender: marker)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMuseum" {
            let dest = segue.destination as! DetailVC
            dest.museum = selectedMuseum
        }
    }

}
