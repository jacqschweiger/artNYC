//
//  MuseumTableViewCell.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/14/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class MuseumTableViewCell: UITableViewCell {
    
    var museumLogo: UIImageView = UIImageView()
    var museumNameLabel: UILabel = UILabel()
    
//    init(frame: CGRect) {
//        super.init(frame: frame)
//    
//        setUpElements()
//        
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUpElements()
        
    }

    private func setUpElements(){
        //image
        contentView.addSubview(museumLogo)
        museumLogo.topAnchor.constraint(equalTo: self.topAnchor, constant: 3).isActive = true
        museumLogo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3).isActive = true
        museumLogo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        museumLogo.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.10).isActive = true
        museumLogo.translatesAutoresizingMaskIntoConstraints = false
        
        //text label
        contentView.addSubview(museumNameLabel)
        museumNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        museumNameLabel.leftAnchor.constraint(equalTo: self.museumLogo.rightAnchor, constant: 3).isActive = true
        museumNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
