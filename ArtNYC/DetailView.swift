//
//  DetailView.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 1/15/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

protocol GoToWebViewDelegate: class {
    func goToWebView()
}

protocol DetailViewDelegate: class {
    func goHome()
    func showMap()
}

class DetailView: UIView, GMSMapViewDelegate {
    
    weak var delegate: GoToWebViewDelegate?
    weak var detailDelegate: DetailViewDelegate?
    var museum: Museum!
    var panoView = GMSPanoramaView()
    var header = UILabel()
     var toolbar = UIToolbar()
    var scrollView = UIScrollView()
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
    var addressContent = UILabel()
    var admissionLabel = UILabel()
    var admissionContent = UILabel()
    var freeAdmissionLabel = UILabel()
    var freeAdmissionContent = UILabel()
    var artCategoriesLabel = UILabel()
    var artCategoriesContent = UILabel()
    var websiteLabel = UILabel()
    var websiteButton: UIButton!
    
    
    init(frame:CGRect, museum: Museum){
        super.init(frame: frame)
        self.museum = museum
        self.backgroundColor = UIColor.white
        self.setUpToolbar()
        self.setUpElements()
        self.panoView.moveNearCoordinate(museum.coordinate)
        reloadInputViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpElements() {
        
        //Header
        self.addSubview(header)
        self.header.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.header.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05).isActive = true
        self.header.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.header.translatesAutoresizingMaskIntoConstraints = false
        
        header.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
    
        //Pano View
        self.addSubview(panoView)
        panoView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        panoView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        panoView.topAnchor.constraint(equalTo: self.header.bottomAnchor).isActive = true
        panoView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45).isActive = true
        panoView.translatesAutoresizingMaskIntoConstraints = false
        
        //Scroll View
        self.addSubview(scrollView)
        scrollView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.panoView.bottomAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.toolbar.topAnchor).isActive = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        //Museum Title Label
        scrollView.addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 7).isActive = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.text = museum.title
        nameLabel.font = UIFont(name: "Avenir Black", size: 22)
        nameLabel.textColor = UIColor(red:44/255, green: 62/255, blue:80/255, alpha:1.0)
        nameLabel.textAlignment = .center
        
        //Art Categories Label
        scrollView.addSubview(artCategoriesLabel)
        artCategoriesLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        artCategoriesLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5).isActive = true
        artCategoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        artCategoriesLabel.text = "• Art  "
        artCategoriesLabel.font = UIFont(name: "Avenir Black", size: 17)
        artCategoriesLabel.textColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Art Categories Content
        scrollView.addSubview(artCategoriesContent)
        artCategoriesContent.leftAnchor.constraint(equalTo: self.artCategoriesLabel.rightAnchor).isActive = true
        artCategoriesContent.centerYAnchor.constraint(equalTo: self.artCategoriesLabel.centerYAnchor).isActive = true
        artCategoriesContent.translatesAutoresizingMaskIntoConstraints = false
        
        artCategoriesContent.text = museum.artCategories
        artCategoriesContent.font = UIFont(name: "Avenir Black", size: 14)
        artCategoriesContent.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        //Address Label
        scrollView.addSubview(addressLabel)
        addressLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        addressLabel.topAnchor.constraint(equalTo: self.artCategoriesContent.bottomAnchor, constant: 5).isActive = true
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addressLabel.text = "• Address  "
        addressLabel.font = UIFont(name: "Avenir Black", size: 17)
        addressLabel.textColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Address Content
        scrollView.addSubview(addressContent)
        addressContent.leftAnchor.constraint(equalTo: self.addressLabel.rightAnchor).isActive = true
        addressContent.centerYAnchor.constraint(equalTo: self.addressLabel.centerYAnchor).isActive = true
        addressContent.translatesAutoresizingMaskIntoConstraints = false
        
        addressContent.text = museum.address
        addressContent.font = UIFont(name: "Avenir Black", size: 14)
        addressContent.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        //Admission Label
        scrollView.addSubview(admissionLabel)
        admissionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        admissionLabel.topAnchor.constraint(equalTo: self.addressLabel.bottomAnchor, constant: 5).isActive = true
        admissionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        admissionLabel.text = "• Admission  "
        admissionLabel.font = UIFont(name: "Avenir Black", size: 17)
        admissionLabel.textColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Admission Content
        scrollView.addSubview(admissionContent)
        admissionContent.leftAnchor.constraint(equalTo: self.admissionLabel.rightAnchor).isActive = true
        admissionContent.centerYAnchor.constraint(equalTo: self.admissionLabel.centerYAnchor).isActive = true
        admissionContent.translatesAutoresizingMaskIntoConstraints = false
        
        admissionContent.text = museum.ticketPrice
        admissionContent.font = UIFont(name: "Avenir Black", size: 14)
        admissionContent.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        //Free Admission Label
        scrollView.addSubview(freeAdmissionLabel)
        freeAdmissionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        freeAdmissionLabel.topAnchor.constraint(equalTo: self.admissionLabel.bottomAnchor, constant: 5).isActive = true
        freeAdmissionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        freeAdmissionLabel.text = "• Free Admission  "
        freeAdmissionLabel.font = UIFont(name: "Avenir Black", size: 17)
        freeAdmissionLabel.textColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Free Admission Content
        scrollView.addSubview(freeAdmissionContent)
        freeAdmissionContent.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        freeAdmissionContent.topAnchor.constraint(equalTo: self.freeAdmissionLabel.bottomAnchor).isActive = true
        freeAdmissionContent.translatesAutoresizingMaskIntoConstraints = false
        
        freeAdmissionContent.text = museum.freeHours
        freeAdmissionContent.font = UIFont(name: "Avenir Black", size: 14)
        freeAdmissionContent.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        //Hours Label
        scrollView.addSubview(hoursLabel)
        hoursLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        hoursLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        hoursLabel.topAnchor.constraint(equalTo: self.freeAdmissionContent.bottomAnchor, constant: 3).isActive = true
        hoursLabel.translatesAutoresizingMaskIntoConstraints = false
        
        hoursLabel.text = "• Hours"
        hoursLabel.font = UIFont(name: "Avenir Black", size: 17)
        hoursLabel.textColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Days Labels
        scrollView.addSubview(sundayLabel)
        sundayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        sundayLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        sundayLabel.topAnchor.constraint(equalTo: self.hoursLabel.bottomAnchor).isActive = true
        sundayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let sunday = museum.hours["Sunday"] else { return }
        sundayLabel.text = "Sunday: \(sunday)"
        sundayLabel.font = UIFont(name: "Avenir Black", size: 14)
        sundayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        scrollView.addSubview(mondayLabel)
        mondayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        mondayLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mondayLabel.topAnchor.constraint(equalTo: self.sundayLabel.bottomAnchor).isActive = true
        mondayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let monday = museum.hours["Monday"] else { return }
        mondayLabel.text = "Monday: \(monday)"
        mondayLabel.font = UIFont(name: "Avenir Black", size: 14)
        mondayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        scrollView.addSubview(tuesdayLabel)
        tuesdayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        tuesdayLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tuesdayLabel.topAnchor.constraint(equalTo: self.mondayLabel.bottomAnchor).isActive = true
        tuesdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let tuesday = museum.hours["Tuesday"] else { return }
        tuesdayLabel.text = "Tuesday: \(tuesday)"
        tuesdayLabel.font = UIFont(name: "Avenir Black", size: 14)
        tuesdayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        scrollView.addSubview(wednesdayLabel)
        wednesdayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        wednesdayLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        wednesdayLabel.topAnchor.constraint(equalTo: self.tuesdayLabel.bottomAnchor).isActive = true
        wednesdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let wednesday = museum.hours["Wednesday"] else { return }
        wednesdayLabel.text = "Wednesday: \(wednesday)"
        wednesdayLabel.font = UIFont(name: "Avenir Black", size: 14)
        wednesdayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        scrollView.addSubview(thursdayLabel)
        thursdayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        thursdayLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        thursdayLabel.topAnchor.constraint(equalTo: self.wednesdayLabel.bottomAnchor).isActive = true
        thursdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let thursday = museum.hours["Thursday"] else { return }
        thursdayLabel.text = "Thursday: \(thursday)"
        thursdayLabel.font = UIFont(name: "Avenir Black", size: 14)
        thursdayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        scrollView.addSubview(fridayLabel)
        fridayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        fridayLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        fridayLabel.topAnchor.constraint(equalTo: self.thursdayLabel.bottomAnchor).isActive = true
        fridayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let friday = museum.hours["Friday"] else { return }
        fridayLabel.text = "Friday: \(friday)"
        fridayLabel.font = UIFont(name: "Avenir Black", size: 14)
        fridayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        scrollView.addSubview(saturdayLabel)
        saturdayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        saturdayLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        saturdayLabel.topAnchor.constraint(equalTo: self.fridayLabel.bottomAnchor).isActive = true
        saturdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let saturday = museum.hours["Saturday"] else { return }
        saturdayLabel.text = "Saturday: \(saturday)"
        saturdayLabel.font = UIFont(name: "Avenir Black", size: 14)
        saturdayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        //Website Label
        scrollView.addSubview(websiteLabel)
        websiteLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        websiteLabel.topAnchor.constraint(equalTo: self.saturdayLabel.bottomAnchor, constant: 3).isActive = true
        websiteLabel.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        websiteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        websiteLabel.text = "• Website"
        websiteLabel.font = UIFont(name: "Avenir Black", size: 17)
        websiteLabel.textColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Website Button
        websiteButton = UIButton(type: .detailDisclosure)
        websiteButton.addTarget(self, action: #selector(self.onGoToWebView), for: UIControlEvents.touchUpInside)
        scrollView.addSubview(websiteButton)
        websiteButton.leftAnchor.constraint(equalTo: self.websiteLabel.rightAnchor, constant: 5).isActive = true
        websiteButton.centerYAnchor.constraint(equalTo: self.websiteLabel.centerYAnchor).isActive = true
        websiteButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        websiteButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        websiteButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpToolbar(){
        
        let homeButton = UIButton()
        homeButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        homeButton.setImage(UIImage(named: "Home Icon"), for: .normal)
        homeButton.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        
        let homeBarButton = UIBarButtonItem()
        homeBarButton.customView = homeButton
        
        let mapButton = UIButton()
        mapButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        mapButton.setImage(UIImage(named: "Compass Icon"), for: .normal)
        mapButton.addTarget(self, action: #selector(showMap), for: .touchUpInside)
        
        let mapBarButton = UIBarButtonItem()
        mapBarButton.customView = mapButton
        
        let settingsButton = UIButton()
        settingsButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        settingsButton.setImage(UIImage(named: "Settings-50"), for: .normal)
        settingsButton.addTarget(self, action: #selector(showMap), for: .touchUpInside)
        
        let settingsBarButton = UIBarButtonItem()
        settingsBarButton.customView = settingsButton
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let toolbarButtons: [UIBarButtonItem] = [homeBarButton, spacer, mapBarButton, spacer, settingsBarButton]
        
        for button in toolbarButtons {
            button.tintColor = UIColor(named: UIColor.ColorName.turquoise)
        }
        
        self.addSubview(toolbar)
        self.toolbar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.toolbar.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.toolbar.translatesAutoresizingMaskIntoConstraints = false
        self.toolbar.setItems(toolbarButtons, animated: false)
        self.toolbar.barTintColor = UIColor(named: UIColor.ColorName.turquoise)
    }

    func onGoToWebView(){
        self.delegate?.goToWebView()
    }
    
    func goHome(){
        self.detailDelegate?.goHome()
    }
    
    func showMap(){
        self.detailDelegate?.showMap()
    }
    
}
