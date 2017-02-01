//
//  FilterView.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/24/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

protocol FilterViewDelegate: class {
    func dismissView()
    func filterMuseums()
}

class FilterView: UIView {
    
    var filterMenu = UIView()
    let titleLabel = UILabel()
    let interiorViewLabel = UILabel()
    let interiorViewSwitch = UISwitch()
    let freeSwitch = UISwitch()
    let openLateSwitch = UISwitch()
    let doneButton = UIButton()
    var delegate: FilterViewDelegate?
    var store = MuseumDataStore.sharedInstance
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(white: 0.5, alpha: 0.75)
        setUpElements()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpElements(){
        
        //Filter Menu
        
        self.addSubview(filterMenu)
        self.filterMenu.backgroundColor = UIColor.white
        self.filterMenu.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.filterMenu.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.filterMenu.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        self.filterMenu.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        self.filterMenu.translatesAutoresizingMaskIntoConstraints = false
        
        //Clear Dismiss Button
        
        let dismissButton = UIButton(type: .system)
        dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        dismissButton.backgroundColor = UIColor.clear
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(dismissButton, belowSubview: filterMenu)
        self.sendSubview(toBack: dismissButton)
        
        dismissButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        dismissButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dismissButton.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        dismissButton.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        
        //Title Label
        self.filterMenu.addSubview(titleLabel)
        titleLabel.text = "Filter Museums"
        titleLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        titleLabel.font = UIFont(name: "Avenir Black", size: 24)
        titleLabel.topAnchor.constraint(equalTo: self.filterMenu.topAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.filterMenu.widthAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.filterMenu.leftAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: self.filterMenu.heightAnchor, multiplier: 0.1).isActive = true
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Interior View Label
        self.filterMenu.addSubview(interiorViewLabel)
        
        
        
        //Interior View Switch
        self.filterMenu.addSubview(interiorViewSwitch)
        interiorViewSwitch.rightAnchor.constraint(equalTo: self.filterMenu.rightAnchor, constant: -20).isActive = true
        interiorViewSwitch.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        interiorViewSwitch.onTintColor = UIColor(named: UIColor.ColorName.turquoise)
        interiorViewSwitch.translatesAutoresizingMaskIntoConstraints = false
        interiorViewSwitch.addTarget(self, action: #selector(filterMuseums), for: UIControlEvents.valueChanged)
        if store.interiorViewSwitchIsOn {
            interiorViewSwitch.setOn(true, animated: false)
        }

        

        //Done Button
        
        self.filterMenu.addSubview(doneButton)
        doneButton.centerXAnchor.constraint(equalTo: self.filterMenu.centerXAnchor).isActive = true
        doneButton.topAnchor.constraint(equalTo: interiorViewSwitch.bottomAnchor, constant: 20).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        doneButton.setTitle("Done", for: .normal)
        doneButton.titleLabel?.font = UIFont(name: "Avenir Black", size: 20)
        doneButton.setTitleColor(UIColor.white, for: .normal)
        doneButton.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        doneButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
    
    }
    
    func dismissView(){
        self.delegate?.dismissView()
    }
    
    func filterMuseums(){
        self.delegate?.filterMuseums()
    }
    
    func checkSwitchState(){
        
    }
    
    
    
}


/*
 self.filterMenu.addSubview(freeSwitch)
 freeSwitch.onTintColor = UIColor(named: UIColor.ColorName.turquoise)
 freeSwitch.rightAnchor.constraint(equalTo: self.filterMenu.rightAnchor, constant: -20).isActive = true
 freeSwitch.topAnchor.constraint(equalTo: interiorViewSwitch.bottomAnchor, constant: 20).isActive = true
 freeSwitch.translatesAutoresizingMaskIntoConstraints = false
 
 
 self.filterMenu.addSubview(openLateSwitch)
 openLateSwitch.onTintColor = UIColor(named: UIColor.ColorName.turquoise)
 openLateSwitch.rightAnchor.constraint(equalTo: self.filterMenu.rightAnchor, constant: -20).isActive = true
 openLateSwitch.topAnchor.constraint(equalTo: freeSwitch.bottomAnchor, constant: 20).isActive = true
 openLateSwitch.translatesAutoresizingMaskIntoConstraints = false
*/
