//
//  MuseumCollectionViewCell.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 2/1/17.
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
        imageView.widthAnchor.constraint(equalToConstant: Constants.image.HSImageWidth.rawValue).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Constants.image.HSImageHeight.rawValue).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        
        imageView.layer.cornerRadius = Constants.image.HSImageCornerRadius.rawValue
        imageView.layer.borderWidth = Constants.image.HSImageBorderWidth.rawValue
        imageView.layer.borderColor = UIColor(named: UIColor.ColorName.oatmeal).cgColor
        imageView.clipsToBounds = true
        
        
        //TITLE SET UP
        titleLabel = UILabel()
        self.contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        
        titleLabel.font = UIFont(name: "Avenir Black", size: 24)
        titleLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
    }
    
}
