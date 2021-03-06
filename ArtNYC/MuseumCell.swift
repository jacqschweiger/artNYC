//
//  MuseumCell.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 2/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import UIKit

class MuseumCell: UICollectionViewCell {
    
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
        self.contentView.layer.cornerRadius = 5
        
        //IMAGE SET UP
        imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        self.contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.8).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.8).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
    }
    
}
