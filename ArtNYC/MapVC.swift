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
    var toolbar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 40.784, longitude: -73.9654, zoom: 11.5)
        self.mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        self.view = mapView
        mapView.delegate = self
        mapView.isMyLocationEnabled = false
        
        setUpToolbar()
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
    
    func setUpToolbar (){
        
        let homeButton = UIButton()
        homeButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        homeButton.setImage(UIImage(named: "Home-50"), for: .normal)
        homeButton.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        
        let homeBarButton = UIBarButtonItem()
        homeBarButton.customView = homeButton
        
        let mapButton = UIButton()
        mapButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        mapButton.setImage(UIImage(named: "Compass-50"), for: .normal)
        mapButton.addTarget(self, action: #selector(showMap), for: .touchUpInside)
        
        let mapBarButton = UIBarButtonItem()
        mapBarButton.customView = mapButton
        
        let settingsButton = UIButton()
        settingsButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        settingsButton.setImage(UIImage(named: "Settings-50"), for: .normal)
        settingsButton.addTarget(self, action: #selector(showMap), for: .touchUpInside)
        
        let settingsBarButton = UIBarButtonItem()
        settingsBarButton.customView = settingsButton
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let toolbarButtons: [UIBarButtonItem] = [homeBarButton, spacer, mapBarButton, spacer, settingsBarButton]
        
        for button in toolbarButtons {
            button.tintColor = UIColor(named: UIColor.ColorName.turquoise)
        }
        
        self.view.addSubview(toolbar)
        self.toolbar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.toolbar.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.toolbar.translatesAutoresizingMaskIntoConstraints = false
        self.toolbar.setItems(toolbarButtons, animated: false)
    }

    
    // MARK: Toolbar Functions
    
    func goHome(){
        let museumListController = MuseumListVC()
        navigationController?.pushViewController(museumListController, animated: false)
    }
    
    func showMap(){
        let mapViewController = MapVC()
        navigationController?.pushViewController(mapViewController, animated: false)
    }
    
    func goToDetailView(){
    }
    
    func sortAZ(){
        print("sort pressed")
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
        navigationController?.pushViewController(detailViewController, animated: false)
    }
}
