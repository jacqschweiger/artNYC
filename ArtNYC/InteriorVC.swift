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
    let container = UIView()
    let titleLabel = UILabel()
    let backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpHeader()
        
        self.panoView.moveNearCoordinate(museum.coordinate)
        setUpPanoView()
    }

    
    func setUpHeader(){
        //Header Container
        self.view.addSubview(container)
        self.container.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.container.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.container.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        self.container.translatesAutoresizingMaskIntoConstraints = false
        self.container.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Title Label
//        self.view.addSubview(titleLabel)
//        self.titleLabel.topAnchor.constraint(equalTo: self.container.topAnchor).isActive = true
//        self.titleLabel.centerXAnchor.constraint(equalTo: self.container.centerXAnchor).isActive = true
//        self.titleLabel.centerYAnchor.constraint(equalTo: self.container.centerYAnchor, constant: -5).isActive = true
//        self.titleLabel.heightAnchor.constraint(equalTo: self.container.heightAnchor).isActive = true
//        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        titleLabel.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
//        titleLabel.text = museum.title
//        titleLabel.font = UIFont(name: "Avenir Black", size: 24)
//        titleLabel.textAlignment = .center
//        titleLabel.textColor = UIColor.white

        //Back Button
        self.view.addSubview(backButton)
        self.backButton.setImage(UIImage(named: "Back Icon"), for: .normal)
        self.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        self.backButton.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 15).isActive = true
        self.backButton.centerYAnchor.constraint(equalTo: self.container.centerYAnchor).isActive = true
        self.backButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.backButton.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        self.backButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpPanoView(){
        self.view.addSubview(panoView)
        panoView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        panoView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        panoView.topAnchor.constraint(equalTo: self.container.bottomAnchor).isActive = true
        panoView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        panoView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func goBack(){
        _ = self.navigationController?.popViewController(animated: true)
    }
    
}

