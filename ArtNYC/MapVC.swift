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
    var header = UILabel()
    var filterButton = UIButton()
    
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
        for museum in store.allMuseums {
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
        let filler = UILabel()
        self.view.addSubview(filler)
        filler.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        filler.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        filler.heightAnchor.constraint(equalToConstant: 6).isActive = true
        filler.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        filler.translatesAutoresizingMaskIntoConstraints = false
        
        //Header Set Up
        self.view.addSubview(header)
        self.header.topAnchor.constraint(equalTo: filler.bottomAnchor).isActive = true
        self.header.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        self.header.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.header.translatesAutoresizingMaskIntoConstraints = false
        
        header.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        header.text = "Art Museums NYC"
        header.font = UIFont(name: "Avenir Black", size: 26)
        header.textAlignment = .center
        header.textColor = UIColor.white
        
        //Filter Set Up
        
        self.view.insertSubview(filterButton, aboveSubview: header)
        self.filterButton.setTitle("•••", for: .normal)
        self.filterButton.addTarget(self, action: #selector(showFilter), for: .touchUpInside)
        
        self.filterButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -15).isActive = true
        self.filterButton.centerYAnchor.constraint(equalTo: self.header.centerYAnchor).isActive = true
        self.filterButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func showFilter(){
        let filterController = FilterVC()
        filterController.modalPresentationStyle = .overFullScreen
        filterController.modalTransitionStyle = .crossDissolve
        self.present(filterController, animated: true, completion: nil)
    }

    // MARK: GMSMapViewDelegate
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        for museum in store.allMuseums {
            if museum.title == marker.title {
                self.selectedMuseum = museum
            }
        }
        let detailViewController = DetailVC()
        detailViewController.museum = self.selectedMuseum
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
