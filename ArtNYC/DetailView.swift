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
    var addressLabel = UILabel()
    var sundayLabel = UILabel()
    var mondayLabel = UILabel()
    var tuesdayLabel = UILabel()
    var wednesdayLabel = UILabel()
    var thursdayLabel = UILabel()
    var fridayLabel = UILabel()
    var saturdayLabel = UILabel()
    var admissionLabel = UILabel()
    var freeAdmissionLabel = UILabel()
    var artCategoriesLabel = UILabel()
    
    
    init(frame:CGRect, museum: Museum){
        super.init(frame: frame)
        self.museum = museum
        self.backgroundColor = UIColor.blue
        self.setUpElements()
        self.panoView.moveNearCoordinate(museum.coordinate)
        reloadInputViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpElements() {
        
        guard let museum = self.museum else { return }
        //Test Label
        self.addSubview(testLabel)
        testLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        testLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        testLabel.text = museum.title
        testLabel.font.withSize(40)
        print(museum.coordinate)
        
        //Pano View
        self.addSubview(panoView)
        panoView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        panoView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        panoView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        panoView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        panoView.translatesAutoresizingMaskIntoConstraints = false
        
//        nameLabel.text = museum.title
//            addressLabel.text = "Address: \(museum.address)"
//            guard let sunday = museum.hours["Sunday"] else { return }
//            guard let monday = museum.hours["Monday"] else { return }
//            guard let tuesday = museum.hours["Tuesday"] else { return }
//            guard let wednesday = museum.hours["Wednesday"] else { return }
//            guard let thursday = museum.hours["Thursday"] else { return }
//            guard let friday = museum.hours["Friday"] else { return }
//            guard let saturday = museum.hours["Saturday"] else { return }
//            sundayLabel.text = "Sunday: \(sunday)"
//            mondayLabel.text = "Monday: \(monday)"
//            tuesdayLabel.text = "Tuesday: \(tuesday)"
//            wednesdayLabel.text = "Wednesday: \(wednesday)"
//            thursdayLabel.text = "Thursday: \(thursday)"
//            fridayLabel.text = "Friday: \(friday)"
//            saturdayLabel.text = "Saturday: \(saturday)"
//            admissionLabel.text = "Admission: \(museum.ticketPrice)"
//            freeAdmissionLabel.text = "Free Admission: \(museum.freeHours)"
//            artCategoriesLabel.text = "Art: \(museum.artCategories)"
        
        
    }
    
}
