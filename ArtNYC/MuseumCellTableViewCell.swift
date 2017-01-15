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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUpElements()
    }

    private func setUpElements(){
        //image
        contentView.addSubview(museumLogo)
        museumLogo.contentMode = .scaleToFill
        museumLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        museumLogo.heightAnchor.constraint(equalToConstant: 38).isActive = true
        museumLogo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        museumLogo.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.10).isActive = true
        museumLogo.translatesAutoresizingMaskIntoConstraints = false
        
        museumLogo.layer.cornerRadius = 5
        museumLogo.layer.borderWidth = 1
        museumLogo.layer.borderColor = UIColor.gray.cgColor
        museumLogo.clipsToBounds = true
        
        //text label
        contentView.addSubview(museumNameLabel)
        museumNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        museumNameLabel.leftAnchor.constraint(equalTo: self.museumLogo.rightAnchor, constant: 10).isActive = true
        museumNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
