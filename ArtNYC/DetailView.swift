//
//  DetailView.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/15/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class DetailView: UIView, GMSMapViewDelegate {
    
    var museum: Museum!
    var panoView = GMSPanoramaView()
    var testLabel = UILabel()
    var nameLabel = UILabel()
    var hoursLabel = UILabel()
    var sundayLabel = UILabel()
    var mondayLabel = UILabel()
    var tuesdayLabel = UILabel()
    var wednesdayLabel = UILabel()
    var thursdayLabel = UILabel()
    var fridayLabel = UILabel()
    var saturdayLabel = UILabel()
    var addressLabel = UILabel()
    var admissionLabel = UILabel()
    var freeAdmissionLabel = UILabel()
    var artCategoriesLabel = UILabel()
    
    
    init(frame:CGRect, museum: Museum){
        super.init(frame: frame)
        self.museum = museum
        self.backgroundColor = UIColor.white
        self.setUpElements()
        self.panoView.moveNearCoordinate(museum.coordinate)
        reloadInputViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpElements() {
    
        //Pano View
        self.addSubview(panoView)
        panoView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        panoView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        panoView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        panoView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45).isActive = true
        panoView.translatesAutoresizingMaskIntoConstraints = false
        
        //Museum Title Label
        self.addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.panoView.bottomAnchor, constant: 5).isActive = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.text = museum.title
        nameLabel.font = UIFont(name: "Avenir Black", size: 24)
        nameLabel.textColor = UIColor(red:44/255, green: 62/255, blue:80/255, alpha:1.0)
        nameLabel.textAlignment = .center
        
        
        //Hours Label
        self.addSubview(hoursLabel)
        hoursLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        hoursLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        hoursLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 3).isActive = true
        hoursLabel.translatesAutoresizingMaskIntoConstraints = false
        
        hoursLabel.text = "Hours"
        hoursLabel.font = UIFont(name: "Avenir Black", size: 17)
        hoursLabel.textColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Days Labels
        self.addSubview(sundayLabel)
        sundayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        sundayLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        sundayLabel.topAnchor.constraint(equalTo: self.hoursLabel.bottomAnchor, constant: 2).isActive = true
        sundayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let sunday = museum.hours["Sunday"] else { return }
        sundayLabel.text = "Sunday: \(sunday)"
        sundayLabel.font = UIFont(name: "Avenir Black", size: 12)
        sundayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        self.addSubview(mondayLabel)
        mondayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        mondayLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mondayLabel.topAnchor.constraint(equalTo: self.sundayLabel.bottomAnchor).isActive = true
        mondayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let monday = museum.hours["Monday"] else { return }
        mondayLabel.text = "Monday: \(monday)"
        mondayLabel.font = UIFont(name: "Avenir Black", size: 12)
        mondayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        self.addSubview(tuesdayLabel)
        tuesdayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        tuesdayLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tuesdayLabel.topAnchor.constraint(equalTo: self.mondayLabel.bottomAnchor).isActive = true
        tuesdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let tuesday = museum.hours["Tuesday"] else { return }
        tuesdayLabel.text = "Tuesday: \(tuesday)"
        tuesdayLabel.font = UIFont(name: "Avenir Black", size: 12)
        tuesdayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        self.addSubview(wednesdayLabel)
        wednesdayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        wednesdayLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        wednesdayLabel.topAnchor.constraint(equalTo: self.tuesdayLabel.bottomAnchor).isActive = true
        wednesdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let wednesday = museum.hours["Wednesday"] else { return }
        wednesdayLabel.text = "Wednesday: \(wednesday)"
        wednesdayLabel.font = UIFont(name: "Avenir Black", size: 12)
        wednesdayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        self.addSubview(thursdayLabel)
        thursdayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        thursdayLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        thursdayLabel.topAnchor.constraint(equalTo: self.wednesdayLabel.bottomAnchor).isActive = true
        thursdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let thursday = museum.hours["Thursday"] else { return }
        thursdayLabel.text = "Thursday: \(thursday)"
        thursdayLabel.font = UIFont(name: "Avenir Black", size: 12)
        thursdayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        self.addSubview(fridayLabel)
        fridayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        fridayLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        fridayLabel.topAnchor.constraint(equalTo: self.thursdayLabel.bottomAnchor).isActive = true
        fridayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let friday = museum.hours["Friday"] else { return }
        fridayLabel.text = "Friday: \(friday)"
        fridayLabel.font = UIFont(name: "Avenir Black", size: 12)
        fridayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        self.addSubview(saturdayLabel)
        saturdayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        saturdayLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        saturdayLabel.topAnchor.constraint(equalTo: self.fridayLabel.bottomAnchor).isActive = true
        saturdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let saturday = museum.hours["Saturday"] else { return }
        saturdayLabel.text = "Saturday: \(saturday)"
        saturdayLabel.font = UIFont(name: "Avenir Black", size: 12)
        saturdayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
//            addressLabel.text = "Address: \(museum.address)"
//            admissionLabel.text = "Admission: \(museum.ticketPrice)"
//            freeAdmissionLabel.text = "Free Admission: \(museum.freeHours)"
//            artCategoriesLabel.text = "Art: \(museum.artCategories)"
        
        
    }
    
}
