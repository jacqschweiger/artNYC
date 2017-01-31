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
    let titleLabel = UILabel()
    let interiorViewSwitch = UISwitch()
    let freeSwitch = UISwitch()
    let openLateSwitch = UISwitch()


    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(white: 1, alpha: 0.75)
        
        self.addSubview(filterMenu)
        self.filterMenu.backgroundColor = UIColor.white
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
        self.filterMenu.addSubview(titleLabel)
        titleLabel.text = "Filter"
        titleLabel.topAnchor.constraint(equalTo: self.filterMenu.topAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.filterMenu.widthAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.filterMenu.leftAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: self.filterMenu.heightAnchor, multiplier: 0.1).isActive = true
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.filterMenu.addSubview(interiorViewSwitch)

        interiorViewSwitch.rightAnchor.constraint(equalTo: self.filterMenu.rightAnchor, constant: -20).isActive = true
        interiorViewSwitch.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        interiorViewSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.filterMenu.addSubview(freeSwitch)
        freeSwitch.rightAnchor.constraint(equalTo: self.filterMenu.rightAnchor, constant: -20).isActive = true
        freeSwitch.topAnchor.constraint(equalTo: interiorViewSwitch.bottomAnchor, constant: 20).isActive = true
        freeSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.filterMenu.addSubview(openLateSwitch)
        openLateSwitch.rightAnchor.constraint(equalTo: self.filterMenu.rightAnchor, constant: -20).isActive = true
        openLateSwitch.topAnchor.constraint(equalTo: freeSwitch.bottomAnchor, constant: 20).isActive = true
        openLateSwitch.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    
}
