//
//  MuseumTableViewCell.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 1/14/17.
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
        museumLogo.heightAnchor.constraint(equalToConstant: 50).isActive = true
        museumLogo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        museumLogo.widthAnchor.constraint(equalToConstant: 50).isActive = true
        museumLogo.translatesAutoresizingMaskIntoConstraints = false
        
        museumLogo.layer.cornerRadius = 5
        museumLogo.layer.borderWidth = 1
        museumLogo.layer.borderColor = UIColor(named: UIColor.ColorName.oatmeal).cgColor
        museumLogo.clipsToBounds = true
        
        //text label
        contentView.addSubview(museumNameLabel)
        museumNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        museumNameLabel.leftAnchor.constraint(equalTo: self.museumLogo.rightAnchor, constant: 12).isActive = true
        museumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        museumNameLabel.font = UIFont(name: "Avenir Black", size: 18)
        museumNameLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)

    }
    
}
