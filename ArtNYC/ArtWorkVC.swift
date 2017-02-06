//
//  ArtWorkVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 2/6/17.
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
    
        //Image
        guard let urlString = self.selectedMuseum?.imageURL else { return }
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
