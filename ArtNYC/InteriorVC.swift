//
//  InteriorVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/24/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class InteriorVC: UIViewController {
    
    var store = MuseumDataStore.sharedInstance
    var museum: Museum!
    var toolbar = UIToolbar()
    var header = UIToolbar()
    var panoView = GMSPanoramaView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpToolbar()
        self.panoView.moveNearCoordinate(museum.coordinate)
        setUpPanoView()
    }
    
    func setUpPanoView(){
        self.view.addSubview(panoView)
        panoView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        panoView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        panoView.topAnchor.constraint(equalTo: self.header.bottomAnchor).isActive = true
        panoView.bottomAnchor.constraint(equalTo: self.toolbar.topAnchor).isActive = true
        panoView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setUpToolbar (){
        
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
        
        let toolbarButtons: [UIBarButtonItem] = [homeBarButton, spacer, mapBarButton, spacer, settingsBarButton]
        
        for button in toolbarButtons {
            button.tintColor = UIColor(named: UIColor.ColorName.turquoise)
        }
        
        self.view.addSubview(toolbar)
        self.toolbar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.toolbar.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.toolbar.translatesAutoresizingMaskIntoConstraints = false
        self.toolbar.setItems(toolbarButtons, animated: false)
        self.toolbar.barTintColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Header
        self.view.addSubview(header)
        self.header.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.header.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.header.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.12).isActive = true
        self.header.translatesAutoresizingMaskIntoConstraints = false
        self.header.barTintColor = UIColor(named: UIColor.ColorName.turquoise)
        
        let backToDetailButton = UIButton()
        backToDetailButton.frame = CGRect(x: 0, y: 0, width: 10, height: 20)
        backToDetailButton.setImage(UIImage(named: "Back Icon"), for: .normal)
        backToDetailButton.addTarget(self, action: #selector(goToDetailView), for: .touchUpInside)
        
        let backToDetailBarButton = UIBarButtonItem()
        backToDetailBarButton.customView = backToDetailButton
        
        let headerButtons: [UIBarButtonItem] = [backToDetailBarButton]
        self.header.setItems(headerButtons, animated: false)
        
        

//        self.header.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//        self.header.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
//        self.header.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
//        self.header.translatesAutoresizingMaskIntoConstraints = false
//        
//        header.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        
    }
    
    
    // MARK: Toolbar Functions
    
    func goHome(){
        let homeController = MuseumListVC()
        navigationController?.pushViewController(homeController, animated: false)
    }
    
    func showMap(){
        let mapViewController = MapVC()
        navigationController?.pushViewController(mapViewController, animated: false)
    }
    
    func goToDetailView(){
        navigationController?.popViewController(animated: true)
    }
    
    func showSettings(){
        //TODO
    }
}

