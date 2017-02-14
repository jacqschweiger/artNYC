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
    var museums: [Museum] = []
    var selectedMuseum: Museum?
    var mapView: GMSMapView!
    var header = UILabel()
    var filterButton = UIButton()
    var filterVC: FilterVC!
    var detailVC: DetailVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 40.784, longitude: -73.9654, zoom: 11.5)
        self.mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        self.view = mapView
        mapView.delegate = self
        mapView.isMyLocationEnabled = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpHeader()
        addLocations()
    }
    
    func addLocations(){
        
        if store.filteredMuseums == [] {
            museums = store.allMuseums
        } else {
            museums = store.filteredMuseums
        }
        
        for museum in museums {
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
        filler.heightAnchor.constraint(equalToConstant: 15).isActive = true
        filler.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        filler.translatesAutoresizingMaskIntoConstraints = false
        
        //Header Set Up
        self.view.addSubview(header)
        self.header.topAnchor.constraint(equalTo: filler.bottomAnchor).isActive = true
        self.header.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        self.header.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.header.translatesAutoresizingMaskIntoConstraints = false
        
        header.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        header.text = "MAP"
        header.font = UIFont(name: "Avenir Black", size: 18)
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
        filterVC = FilterVC()
        filterVC.modalPresentationStyle = .overFullScreen
        filterVC.modalTransitionStyle = .crossDissolve
        self.present(filterVC, animated: true, completion: nil)
    }

    // MARK: GMSMapViewDelegate
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        if store.filteredMuseums.count > 0 {
            self.museums = store.filteredMuseums
        } else if store.filteredMuseums.count == 0 {
            self.museums = store.allMuseums
        }

        for museum in museums {
            if museum.title == marker.title {
                self.selectedMuseum = museum
            }
        }
        
        detailVC.museum = self.selectedMuseum
        navigationController?.pushViewController(detailVC, animated: true)
    }

}
