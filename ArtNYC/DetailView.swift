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

protocol ShowInfoDelegate: class {
    func goToWebView()
    func goToInteriorView()
}

class DetailView: UIView, GMSMapViewDelegate {
    
    weak var showInfoDelegate: ShowInfoDelegate?
    weak var navDelegate: NavigationDelegate?
    var museum: Museum!
    var panoView = GMSPanoramaView()
    var header = UILabel()
    var navBar = UIToolbar()
    var scrollView = UIScrollView()
    var seeInsideButton = UIButton()
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
    var websiteButton: UIButton!
    
    
    init(frame:CGRect, museum: Museum){
        super.init(frame: frame)
        self.museum = museum
        self.backgroundColor = UIColor.white
        self.setUpNavBar()
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
        self.header.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        self.header.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.header.translatesAutoresizingMaskIntoConstraints = false
        
        header.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        header.text = museum.title
        header.font = UIFont(name: "Avenir Black", size: 24)
        header.textAlignment = .center
        header.textColor = UIColor.white
        
        //Pano View
        self.addSubview(panoView)
        panoView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        panoView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        panoView.topAnchor.constraint(equalTo: self.header.bottomAnchor, constant: 20).isActive = true
        panoView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25).isActive = true
        panoView.translatesAutoresizingMaskIntoConstraints = false
        
        //Scroll View
        self.addSubview(scrollView)
        scrollView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.panoView.bottomAnchor, constant: 10).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.navBar.topAnchor).isActive = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Intervior View Label // Add only if museum has street view
        if self.museum.interiorMapView == true {
            
            seeInsideButton = UIButton(type: .custom)
            seeInsideButton.addTarget(self, action: #selector(self.onGoToInteriorView), for: UIControlEvents.touchUpInside)
            scrollView.addSubview(seeInsideButton)
            seeInsideButton.heightAnchor.constraint(equalToConstant: 20)
            seeInsideButton.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 20).isActive = true
            seeInsideButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            seeInsideButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
            seeInsideButton.translatesAutoresizingMaskIntoConstraints = false
            
            seeInsideButton.setTitle("See 360° Gallery View", for: .normal)
            seeInsideButton.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
            seeInsideButton.tintColor = UIColor.white
            seeInsideButton.titleLabel?.font = UIFont(name: "Avenir Black", size: 20)
            
            //Art Categories Label
            scrollView.addSubview(artCategoriesLabel)
            artCategoriesLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            artCategoriesLabel.topAnchor.constraint(equalTo: self.seeInsideButton.bottomAnchor, constant: 40).isActive = true
            artCategoriesLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
            artCategoriesLabel.heightAnchor.constraint(equalToConstant: 20)
            artCategoriesLabel.translatesAutoresizingMaskIntoConstraints = false
            
            artCategoriesLabel.text = "Art"
            artCategoriesLabel.textAlignment = .center
            artCategoriesLabel.font = UIFont(name: "Avenir Black", size: 20)
            artCategoriesLabel.textColor = UIColor.white
            artCategoriesLabel.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
            
            //Art Categories Content
            scrollView.addSubview(artCategoriesContent)
            artCategoriesContent.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            artCategoriesContent.topAnchor.constraint(equalTo: self.artCategoriesLabel.bottomAnchor, constant: 10).isActive = true
            artCategoriesContent.translatesAutoresizingMaskIntoConstraints = false
            
            artCategoriesContent.text = museum.artCategories
            artCategoriesContent.font = UIFont(name: "Avenir Black", size: 16)
            artCategoriesContent.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        }
            
        else {
            
            //Art Categories Label
            scrollView.addSubview(artCategoriesLabel)
            artCategoriesLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            artCategoriesLabel.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 20).isActive = true
            artCategoriesLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
            artCategoriesLabel.heightAnchor.constraint(equalToConstant: 20)
            artCategoriesLabel.translatesAutoresizingMaskIntoConstraints = false
            
            artCategoriesLabel.text = "Art"
            artCategoriesLabel.textAlignment = .center
            artCategoriesLabel.font = UIFont(name: "Avenir Black", size: 20)
            artCategoriesLabel.textColor = UIColor.white
            artCategoriesLabel.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
            
            //Art Categories Content
            scrollView.addSubview(artCategoriesContent)
            artCategoriesContent.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            artCategoriesContent.topAnchor.constraint(equalTo: self.artCategoriesLabel.bottomAnchor, constant: 10).isActive = true
            artCategoriesContent.translatesAutoresizingMaskIntoConstraints = false
            
            artCategoriesContent.text = museum.artCategories
            artCategoriesContent.font = UIFont(name: "Avenir Black", size: 16)
            artCategoriesContent.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        }
        
        //Admission Label
        scrollView.addSubview(admissionLabel)
        admissionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        admissionLabel.topAnchor.constraint(equalTo: self.artCategoriesContent.bottomAnchor, constant: 20).isActive = true
        admissionLabel.heightAnchor.constraint(equalToConstant: 20)
        admissionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        admissionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        admissionLabel.text = "Admission"
        admissionLabel.textAlignment = .center
        admissionLabel.font = UIFont(name: "Avenir Black", size: 20)
        admissionLabel.textColor = UIColor.white
        admissionLabel.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Admission Content
        scrollView.addSubview(admissionContent)
        admissionContent.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        admissionContent.topAnchor.constraint(equalTo: self.admissionLabel.bottomAnchor, constant: 10).isActive = true
        admissionContent.translatesAutoresizingMaskIntoConstraints = false
        
        admissionContent.text = museum.ticketPrice
        admissionContent.font = UIFont(name: "Avenir Black", size: 16)
        admissionContent.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        //Free Admission Label
        scrollView.addSubview(freeAdmissionLabel)
        freeAdmissionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        freeAdmissionLabel.topAnchor.constraint(equalTo: self.admissionContent.bottomAnchor, constant: 20).isActive = true
        freeAdmissionLabel.heightAnchor.constraint(equalToConstant: 20)
        freeAdmissionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        freeAdmissionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        freeAdmissionLabel.text = "Free Admission"
        freeAdmissionLabel.textAlignment = .center
        freeAdmissionLabel.font = UIFont(name: "Avenir Black", size: 20)
        freeAdmissionLabel.textColor = UIColor.white
        freeAdmissionLabel.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Free Admission Content
        scrollView.addSubview(freeAdmissionContent)
        freeAdmissionContent.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        freeAdmissionContent.topAnchor.constraint(equalTo: self.freeAdmissionLabel.bottomAnchor, constant: 10).isActive = true
        freeAdmissionContent.translatesAutoresizingMaskIntoConstraints = false
        
        freeAdmissionContent.numberOfLines = 0
        freeAdmissionContent.textAlignment = .center
        freeAdmissionContent.text = museum.freeHours
        freeAdmissionContent.font = UIFont(name: "Avenir Black", size: 16)
        freeAdmissionContent.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        //Address Label
        scrollView.addSubview(addressLabel)
        addressLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: self.freeAdmissionContent.bottomAnchor, constant: 20).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 20)
        addressLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addressLabel.text = "Address"
        addressLabel.textAlignment = .center
        addressLabel.font = UIFont(name: "Avenir Black", size: 20)
        addressLabel.textColor = UIColor.white
        addressLabel.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Address Content
        scrollView.addSubview(addressContent)
        addressContent.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        addressContent.topAnchor.constraint(equalTo: self.addressLabel.bottomAnchor, constant: 10).isActive = true
        addressContent.translatesAutoresizingMaskIntoConstraints = false
        
        addressContent.text = museum.address
        addressContent.font = UIFont(name: "Avenir Black", size: 16)
        addressContent.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        //Hours Label
        scrollView.addSubview(hoursLabel)
        hoursLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        hoursLabel.topAnchor.constraint(equalTo: self.addressContent.bottomAnchor, constant: 20).isActive = true
        hoursLabel.heightAnchor.constraint(equalToConstant: 20)
        hoursLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        hoursLabel.translatesAutoresizingMaskIntoConstraints = false
        
        hoursLabel.text = "Hours"
        hoursLabel.textAlignment = .center
        hoursLabel.font = UIFont(name: "Avenir Black", size: 20)
        hoursLabel.textColor = UIColor.white
        hoursLabel.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Days Labels
        scrollView.addSubview(sundayLabel)
        sundayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        sundayLabel.topAnchor.constraint(equalTo: self.hoursLabel.bottomAnchor, constant: 10).isActive = true
        sundayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let sunday = museum.hours["Sunday"] else { return }
        sundayLabel.text = "Sunday: \(sunday)"
        sundayLabel.font = UIFont(name: "Avenir Black", size: 16)
        sundayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        scrollView.addSubview(mondayLabel)
        mondayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mondayLabel.topAnchor.constraint(equalTo: self.sundayLabel.bottomAnchor).isActive = true
        mondayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let monday = museum.hours["Monday"] else { return }
        mondayLabel.text = "Monday: \(monday)"
        mondayLabel.font = UIFont(name: "Avenir Black", size: 16)
        mondayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        scrollView.addSubview(tuesdayLabel)
        tuesdayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tuesdayLabel.topAnchor.constraint(equalTo: self.mondayLabel.bottomAnchor).isActive = true
        tuesdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let tuesday = museum.hours["Tuesday"] else { return }
        tuesdayLabel.text = "Tuesday: \(tuesday)"
        tuesdayLabel.font = UIFont(name: "Avenir Black", size: 16)
        tuesdayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        scrollView.addSubview(wednesdayLabel)
        wednesdayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        wednesdayLabel.topAnchor.constraint(equalTo: self.tuesdayLabel.bottomAnchor).isActive = true
        wednesdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let wednesday = museum.hours["Wednesday"] else { return }
        wednesdayLabel.text = "Wednesday: \(wednesday)"
        wednesdayLabel.font = UIFont(name: "Avenir Black", size: 16)
        wednesdayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        scrollView.addSubview(thursdayLabel)
        thursdayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        thursdayLabel.topAnchor.constraint(equalTo: self.wednesdayLabel.bottomAnchor).isActive = true
        thursdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let thursday = museum.hours["Thursday"] else { return }
        thursdayLabel.text = "Thursday: \(thursday)"
        thursdayLabel.font = UIFont(name: "Avenir Black", size: 16)
        thursdayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        scrollView.addSubview(fridayLabel)
        fridayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        fridayLabel.topAnchor.constraint(equalTo: self.thursdayLabel.bottomAnchor).isActive = true
        fridayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let friday = museum.hours["Friday"] else { return }
        fridayLabel.text = "Friday: \(friday)"
        fridayLabel.font = UIFont(name: "Avenir Black", size: 16)
        fridayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        scrollView.addSubview(saturdayLabel)
        saturdayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        saturdayLabel.topAnchor.constraint(equalTo: self.fridayLabel.bottomAnchor).isActive = true
        saturdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let saturday = museum.hours["Saturday"] else { return }
        saturdayLabel.text = "Saturday: \(saturday)"
        saturdayLabel.font = UIFont(name: "Avenir Black", size: 16)
        saturdayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        //Website Label
        websiteButton = UIButton(type: .custom)
        websiteButton.addTarget(self, action: #selector(self.onGoToWebView), for: UIControlEvents.touchUpInside)
        scrollView.addSubview(websiteButton)
        websiteButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        websiteButton.topAnchor.constraint(equalTo: self.saturdayLabel.bottomAnchor, constant: 20).isActive = true
        websiteButton.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -20).isActive = true
        websiteButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        websiteButton.translatesAutoresizingMaskIntoConstraints = false
        
        websiteButton.setTitle("See Website", for: .normal)
        websiteButton.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        websiteButton.tintColor = UIColor.white
        websiteButton.titleLabel?.font = UIFont(name: "Avenir Black", size: 20)
    }
    
    
    func setUpNavBar(){
        
        let homeButton = UIButton()
        homeButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        homeButton.setImage(UIImage(named: "Home Icon"), for: .normal)
        homeButton.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        
        let homeBarButton = UIBarButtonItem()
        homeBarButton.customView = homeButton
        
        let mapButton = UIButton()
        mapButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        mapButton.setImage(UIImage(named: "Compass Icon"), for: .normal)
        mapButton.addTarget(self, action: #selector(showMap), for: .touchUpInside)
        
        let mapBarButton = UIBarButtonItem()
        mapBarButton.customView = mapButton
        
        let settingsButton = UIButton()
        settingsButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        settingsButton.setImage(UIImage(named: "Settings Icon"), for: .normal)
        settingsButton.addTarget(self, action: #selector(showSettings), for: .touchUpInside)
        
        let settingsBarButton = UIBarButtonItem()
        settingsBarButton.customView = settingsButton
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let navBarButtons: [UIBarButtonItem] = [homeBarButton, spacer, mapBarButton, spacer, settingsBarButton]
        
        self.addSubview(navBar)
        self.navBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.navBar.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.navBar.translatesAutoresizingMaskIntoConstraints = false
        self.navBar.setItems(navBarButtons, animated: false)
        self.navBar.barTintColor = UIColor(named: UIColor.ColorName.turquoise)
    }
    
    // MARK: Show Info Button Functions
    
    func onGoToWebView(){
        self.showInfoDelegate?.goToWebView()
    }
    
    func onGoToInteriorView(){
        self.showInfoDelegate?.goToInteriorView()
    }
    
    
    // MARK: NavBar Functions
    
    func goHome(){
        self.navDelegate?.goHome()
    }
    
    func showMap(){
        self.navDelegate?.showMap()
    }
    
    func showSettings(){
        //TODO
    }
    
}
