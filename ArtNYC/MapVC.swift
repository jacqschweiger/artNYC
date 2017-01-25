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
    var header = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 40.784, longitude: -73.9654, zoom: 11.5)
        self.mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        self.view = mapView
        mapView.delegate = self
        mapView.isMyLocationEnabled = false
        
        setUpHeader()
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
    
    func setUpHeader() {
    
        //Header
        self.view.addSubview(header)
        self.header.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.header.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.header.translatesAutoresizingMaskIntoConstraints = false
        
        header.barTintColor = UIColor(named: UIColor.ColorName.turquoise)
        
    }

    // MARK: GMSMapViewDelegate
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        for museum in store.museums {
            if museum.title == marker.title {
                self.selectedMuseum = museum
            }
        }
        let detailViewController = DetailVC()
        detailViewController.museum = self.selectedMuseum
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
