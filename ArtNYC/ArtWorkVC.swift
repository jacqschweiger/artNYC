//
//  ArtWorkVC.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 2/6/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class ArtWorkVC: UIViewController {
    
    var selectedMuseum: Museum?
    var artWork = UIImageView()
    var detailView: DetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }
    
    func setUpElements() {
        
        guard let museum = self.selectedMuseum else { return }
    
        //Image
        let urlString = museum.imageURL
        let url = URL(string: urlString)
        artWork.kf.setImage(with: url)
        artWork.contentMode = .scaleAspectFit
        artWork.clipsToBounds = true

        self.view.addSubview(artWork)
        artWork.translatesAutoresizingMaskIntoConstraints = false
        artWork.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9).isActive = true
        artWork.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        artWork.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        artWork.backgroundColor = UIColor.black
        
        //Credits
        let creditsLabel = UILabel()
        self.view.addSubview(creditsLabel)
        creditsLabel.translatesAutoresizingMaskIntoConstraints = false
        creditsLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -5).isActive = true
        creditsLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        creditsLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        
        creditsLabel.text = museum.imageCredit
        creditsLabel.font = UIFont(name: "Avenir", size: 10)
        creditsLabel.textColor = UIColor.white
        creditsLabel.numberOfLines = 0
        
        
        
        //Dismiss Button
        let dismissButton = UIButton(type: .system)
        self.view.insertSubview(dismissButton, belowSubview: artWork)
        self.view.sendSubview(toBack: dismissButton)
        
        dismissButton.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        dismissButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        dismissButton.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        dismissButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        
        dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        dismissButton.backgroundColor = UIColor.black
    }
    
    
    func dismissView(){
        navigationController?.popViewController(animated: false)
    }
}
