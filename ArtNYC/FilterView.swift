//
//  FilterView.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 1/24/17.
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
    let freeAdmissionLabel = UILabel()
    let freeAdmissionSwitch = UISwitch()
    let openLateLabel = UILabel()
    let openLateSwitch = UISwitch()
    let interiorViewLabel = UILabel()
    let interiorViewSwitch = UISwitch()
    let doneButton = UIButton()
    weak var delegate: FilterViewDelegate?
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
        self.filterMenu.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20).isActive = true
        self.filterMenu.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        self.filterMenu.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        self.filterMenu.layer.cornerRadius = 5
        self.filterMenu.translatesAutoresizingMaskIntoConstraints = false
        
        //Clear Dismiss Button
        let dismissButton = UIButton(type: .system)
        self.insertSubview(dismissButton, belowSubview: filterMenu)
        self.sendSubview(toBack: dismissButton)
        
        dismissButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        dismissButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dismissButton.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        dismissButton.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        
        dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        dismissButton.backgroundColor = UIColor.clear
        
        //Title Label
        self.filterMenu.addSubview(titleLabel)
        titleLabel.text = "FILTER MUSEUMS"
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "Avenir", size: 18)
        titleLabel.topAnchor.constraint(equalTo: self.filterMenu.topAnchor, constant: 10).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.filterMenu.widthAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.filterMenu.leftAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: self.filterMenu.heightAnchor, multiplier: 0.1).isActive = true
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Free Admission Label
        self.filterMenu.addSubview(freeAdmissionLabel)
        freeAdmissionLabel.leftAnchor.constraint(equalTo: self.filterMenu.leftAnchor, constant: 20).isActive = true
        freeAdmissionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        freeAdmissionLabel.text = "Free Admission Hours"
        freeAdmissionLabel.font = UIFont(name: "Avenir", size: 16)
        freeAdmissionLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        freeAdmissionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Free Admission Switch
        self.filterMenu.addSubview(freeAdmissionSwitch)
        freeAdmissionSwitch.onTintColor = UIColor(named: UIColor.ColorName.turquoise)
        freeAdmissionSwitch.centerYAnchor.constraint(equalTo: freeAdmissionLabel.centerYAnchor).isActive = true
        freeAdmissionSwitch.leftAnchor.constraint(equalTo: self.freeAdmissionLabel.rightAnchor, constant: 15).isActive = true
        freeAdmissionSwitch.translatesAutoresizingMaskIntoConstraints = false
        if store.freeAdmissionSwitchIsOn {
            freeAdmissionSwitch.setOn(true, animated: false)
        }
        
        //Open Late Label
        self.filterMenu.addSubview(openLateLabel)
        openLateLabel.leftAnchor.constraint(equalTo: self.filterMenu.leftAnchor, constant: 20).isActive = true
        openLateLabel.topAnchor.constraint(equalTo: freeAdmissionLabel.bottomAnchor, constant: 25).isActive = true
        openLateLabel.text = "Open Late"
        openLateLabel.font = UIFont(name: "Avenir", size: 16)
        openLateLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        openLateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Open Late Switch
        self.filterMenu.addSubview(openLateSwitch)
        openLateSwitch.onTintColor = UIColor(named: UIColor.ColorName.turquoise)
        openLateSwitch.leftAnchor.constraint(equalTo: self.freeAdmissionSwitch.leftAnchor).isActive = true
        openLateSwitch.centerYAnchor.constraint(equalTo: openLateLabel.centerYAnchor).isActive = true
        openLateSwitch.translatesAutoresizingMaskIntoConstraints = false
        if store.openLateSwitchIsOn {
            openLateSwitch.setOn(true, animated: false)
        }
        
        //Interior View Label
        self.filterMenu.addSubview(interiorViewLabel)
        interiorViewLabel.leftAnchor.constraint(equalTo: self.filterMenu.leftAnchor, constant: 20).isActive = true
        interiorViewLabel.topAnchor.constraint(equalTo: openLateLabel.bottomAnchor, constant: 25).isActive = true
        interiorViewLabel.text = "360° Gallery View"
        interiorViewLabel.font = UIFont(name: "Avenir", size: 16)
        interiorViewLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        interiorViewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Interior View Switch
        self.filterMenu.addSubview(interiorViewSwitch)
        interiorViewSwitch.leftAnchor.constraint(equalTo: self.freeAdmissionSwitch.leftAnchor).isActive = true
        interiorViewSwitch.centerYAnchor.constraint(equalTo: interiorViewLabel.centerYAnchor).isActive = true
        interiorViewSwitch.onTintColor = UIColor(named: UIColor.ColorName.turquoise)
        interiorViewSwitch.translatesAutoresizingMaskIntoConstraints = false
        if store.interiorViewSwitchIsOn {
            interiorViewSwitch.setOn(true, animated: false)
        }

        
        //Done Button
        self.filterMenu.addSubview(doneButton)
        doneButton.centerXAnchor.constraint(equalTo: self.filterMenu.centerXAnchor).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: self.filterMenu.bottomAnchor, constant: -20).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        doneButton.setTitle("Done", for: .normal)
        doneButton.titleLabel?.font = UIFont(name: "Avenir", size: 18)
        doneButton.setTitleColor(UIColor.white, for: .normal)
        doneButton.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        doneButton.layer.cornerRadius = 5
        doneButton.addTarget(self, action: #selector(donePressed), for: .touchUpInside)
    }
    
    func dismissView(){
        self.delegate?.dismissView()
    }
    
    func donePressed() {
        self.delegate?.filterMuseums()
        self.delegate?.dismissView()
    }

}
