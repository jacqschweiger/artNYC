//
//  FilterView.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/24/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class FilterView: UIView {
    
    var filterMenu = UIView()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(white: 1, alpha: 0.75)
        
        self.addSubview(filterMenu)
        self.filterMenu.backgroundColor = UIColor.blue
        self.filterMenu.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.filterMenu.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.filterMenu.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        self.filterMenu.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        self.filterMenu.translatesAutoresizingMaskIntoConstraints = false
        
        setUpElements()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpElements(){
        let titleLabel = UILabel()
        self.filterMenu.addSubview(titleLabel)
        titleLabel.backgroundColor = UIColor.red
        titleLabel.text = "Filter"
        titleLabel.topAnchor.constraint(equalTo: self.filterMenu.topAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.filterMenu.widthAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.filterMenu.leftAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: self.filterMenu.heightAnchor, multiplier: 0.1).isActive = true
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
}
