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
    var navBar = UIToolbar()
    var header = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 40.784, longitude: -73.9654, zoom: 11.5)
        self.mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        self.view = mapView
        mapView.delegate = self
        mapView.isMyLocationEnabled = false
        
        setUpNavBar()
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
    
    func setUpNavBar (){
        
        let homeButton = UIButton()
        homeButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        homeButton.setImage(UIImage(named: "Home Icon"), for: .normal)
        homeButton.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        
        let homeBarButton = UIBarButtonItem()
        homeBarButton.customView = homeButton
        
        let mapButton = UIButton()
        mapButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        mapButton.setImage(UIImage(named: "Compass Icon"), for: .normal)
        mapButton.addTarget(self, action: #selector(showMap), for: .touchUpInside)
        
        let mapBarButton = UIBarButtonItem()
        mapBarButton.customView = mapButton
        
        let settingsButton = UIButton()
        settingsButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        settingsButton.setImage(UIImage(named: "Settings Icon"), for: .normal)
        settingsButton.addTarget(self, action: #selector(showSettings), for: .touchUpInside)
        
        let settingsBarButton = UIBarButtonItem()
        settingsBarButton.customView = settingsButton
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let navBarButtons: [UIBarButtonItem] = [homeBarButton, spacer, mapBarButton, spacer, settingsBarButton]
        
        self.view.addSubview(navBar)
        self.navBar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.navBar.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.navBar.translatesAutoresizingMaskIntoConstraints = false
        self.navBar.setItems(navBarButtons, animated: false)
        self.navBar.barTintColor = UIColor(named: UIColor.ColorName.turquoise)
    }
    
    func setUpHeader() {
    
        //Header
        self.view.addSubview(header)
        self.header.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.header.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.header.translatesAutoresizingMaskIntoConstraints = false
        
        header.barTintColor = UIColor(named: UIColor.ColorName.turquoise)
        
    }
}


    // MARK: NavBar Functions

extension MapVC {

    func goHome(){
        let homeController = MuseumListVC()
        navigationController?.pushViewController(homeController, animated: false)
    }
    
    func showMap(){
        let mapViewController = MapVC()
        navigationController?.pushViewController(mapViewController, animated: false)
    }
    
    func goToDetailView(){
    }
    
    func showSettings(){
        //TODO
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
