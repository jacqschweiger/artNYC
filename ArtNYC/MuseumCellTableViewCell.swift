//
//  MuseumTableViewCell.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/14/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import UIKit

class MuseumTableViewCell: UITableViewCell {
    
    var museumLogo: UIImageView = UIImageView()
    var museumNameLabel: UILabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //image
        contentView.addSubview(museumLogo)
        museumLogo.topAnchor.constraint(equalTo: self.topAnchor, constant: 3).isActive = true
        museumLogo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3).isActive = true
        museumLogo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 3).isActive = true
        museumLogo.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.08).isActive = true
        museumLogo.translatesAutoresizingMaskIntoConstraints = false
        
        //text label
        contentView.addSubview(museumNameLabel)
        museumNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        museumNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 44).isActive = true
        museumNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
