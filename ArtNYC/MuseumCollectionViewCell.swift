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
        
        //IMAGE SET UP
        imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        self.contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: Constants.image.ImageWidth.rawValue).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Constants.image.ImageHeight.rawValue).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        
        imageView.layer.cornerRadius = Constants.image.ImageCornerRadius.rawValue
        imageView.layer.borderWidth = Constants.image.ImageBorderWidth.rawValue
        imageView.layer.borderColor = UIColor(named: UIColor.ColorName.oatmeal).cgColor
        imageView.clipsToBounds = true
        
        
        //TITLE SET UP
        titleLabel = UILabel()
        self.contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        
        titleLabel.font = UIFont(name: "Avenir Black", size: 14)
        titleLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        titleLabel.textAlignment = .center
        
        
    }
    
}
