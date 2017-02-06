//
//  MuseumCollectionViewCell.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 2/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import UIKit

class MuseumCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
          setUpElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUpElements()
    }

    
    private func setUpElements() {
        
        self.contentView.backgroundColor = UIColor.white
        
        //IMAGE SET UP
        imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        self.contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: -10).isActive = true
        
        //imageView.layer.cornerRadius = 10
        //imageView.layer.borderWidth = 2
        //imageView.layer.borderColor = UIColor(named: UIColor.ColorName.turquoise).cgColor
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        
        //TITLE SET UP
        titleLabel = UILabel()
        self.contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 5).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        
        titleLabel.font = UIFont(name: "Avenir Black", size: 13)
        titleLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        titleLabel.textAlignment = .center
        
        
    }
    
}
