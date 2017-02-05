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
    var panoView = GMSPanoramaView()
    let backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setUpBackButton()
        
        self.panoView.moveNearCoordinate(museum.coordinate)
        setUpPanoView()
    }

    func setUpBackButton(){
        self.view.addSubview(backButton)
        self.backButton.setImage(UIImage(named: "Circle Back"), for: .normal)
        self.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        self.backButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        self.backButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        self.backButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.backButton.translatesAutoresizingMaskIntoConstraints = false

    }
    
    func setUpPanoView(){
        self.view.addSubview(panoView)
        self.view.sendSubview(toBack: panoView)
        panoView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        panoView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        panoView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        panoView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        panoView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func goBack(){
        _ = self.navigationController?.popViewController(animated: true)
    }
    
}

