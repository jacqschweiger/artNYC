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
import Kingfisher 

protocol DetailViewDelegate: class {
    func goToWebView()
    func goToInteriorView()
    func showArtWork()
}

class DetailView: UIView, GMSMapViewDelegate {
    
    weak var delegate: DetailViewDelegate?
    weak var backDelegate: BackDelegate?
    var museum: Museum!
    var museumImage = UIImageView()
    var imageButton = UIButton()
    var container = UIView()
    var titleLabel = UILabel()
    var backButton = UIButton()
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
        self.setUpElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpElements() {
        
        //Back Button
        self.addSubview(backButton)
        self.backButton.setImage(UIImage(named: "Circle Back"), for: .normal)
        self.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        self.backButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        self.backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        self.backButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.backButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Scroll View
        self.addSubview(scrollView)
        self.sendSubview(toBack: scrollView)
        scrollView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        //Image View
        self.scrollView.addSubview(museumImage)
        let urlString = self.museum.imageURL
        let url = URL(string: urlString)
        
        museumImage.kf.indicatorType = .activity
        museumImage.kf.setImage(with: url)
        
        museumImage.contentMode = .scaleAspectFill
        museumImage.clipsToBounds = true
        
        museumImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        museumImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        museumImage.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        museumImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.40).isActive = true
        museumImage.translatesAutoresizingMaskIntoConstraints = false
        
        //Image Button
        self.scrollView.addSubview(imageButton)
        imageButton.leftAnchor.constraint(equalTo: self.museumImage.leftAnchor).isActive = true
        imageButton.rightAnchor.constraint(equalTo: self.museumImage.rightAnchor).isActive = true
        imageButton.topAnchor.constraint(equalTo: self.museumImage.topAnchor).isActive = true
        imageButton.heightAnchor.constraint(equalTo: self.museumImage.heightAnchor).isActive = true
        imageButton.backgroundColor = UIColor.clear
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        
        imageButton.addTarget(self, action: #selector(showArtWork), for: .touchUpInside)
        
        
        //Title Label
        self.scrollView.addSubview(titleLabel)
        self.titleLabel.topAnchor.constraint(equalTo: self.museumImage.bottomAnchor, constant: -2).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        titleLabel.font = UIFont(name: "Avenir Black", size: 28)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.white
        
        if museum.title == "The Metropolitan Museum of Art" {
            titleLabel.text = "The Met"
        } else if museum.title == "Solomon R. Guggenheim Museum" {
            titleLabel.text = "The Guggenheim"
        } else if museum.title == "Whitney Museum of American Art" {
            titleLabel.text = "The Whitney"
        } else {
            titleLabel.text = museum.title
        }
        
        //Art Categories Label
        scrollView.addSubview(artCategoriesLabel)
        artCategoriesLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        artCategoriesLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20).isActive = true
        artCategoriesLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        artCategoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        artCategoriesLabel.text = "Art"
        artCategoriesLabel.font = UIFont(name: "Avenir Black", size: 20)
        artCategoriesLabel.textColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Art Categories Content
        scrollView.addSubview(artCategoriesContent)
        artCategoriesContent.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 50).isActive = true
        artCategoriesContent.topAnchor.constraint(equalTo: self.artCategoriesLabel.bottomAnchor).isActive = true
        artCategoriesContent.translatesAutoresizingMaskIntoConstraints = false
        
        artCategoriesContent.text = museum.artCategories
        artCategoriesContent.font = UIFont(name: "Avenir Black", size: 16)
        artCategoriesContent.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        //Admission Label
        scrollView.addSubview(admissionLabel)
        admissionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        admissionLabel.topAnchor.constraint(equalTo: self.artCategoriesContent.bottomAnchor, constant: 20).isActive = true
        admissionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        admissionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        admissionLabel.text = "Admission"
        admissionLabel.font = UIFont(name: "Avenir Black", size: 20)
        admissionLabel.textColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Admission Content
        scrollView.addSubview(admissionContent)
        admissionContent.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 50).isActive = true
        admissionContent.topAnchor.constraint(equalTo: self.admissionLabel.bottomAnchor).isActive = true
        admissionContent.translatesAutoresizingMaskIntoConstraints = false
        
        admissionContent.text = museum.ticketPrice
        admissionContent.font = UIFont(name: "Avenir Black", size: 16)
        admissionContent.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        //Free Admission Label
        scrollView.addSubview(freeAdmissionLabel)
        freeAdmissionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        freeAdmissionLabel.topAnchor.constraint(equalTo: self.admissionContent.bottomAnchor, constant: 20).isActive = true
        freeAdmissionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        freeAdmissionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        freeAdmissionLabel.text = "Free Admission"
        freeAdmissionLabel.font = UIFont(name: "Avenir Black", size: 20)
        freeAdmissionLabel.textColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Free Admission Content
        scrollView.addSubview(freeAdmissionContent)
        freeAdmissionContent.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 50).isActive = true
        freeAdmissionContent.topAnchor.constraint(equalTo: self.freeAdmissionLabel.bottomAnchor).isActive = true
        freeAdmissionContent.translatesAutoresizingMaskIntoConstraints = false
        
        freeAdmissionContent.numberOfLines = 0
        freeAdmissionContent.text = museum.freeHours
        freeAdmissionContent.font = UIFont(name: "Avenir Black", size: 16)
        freeAdmissionContent.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        //Address Label
        scrollView.addSubview(addressLabel)
        addressLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: self.freeAdmissionContent.bottomAnchor, constant: 20).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addressLabel.text = "Address"
        addressLabel.font = UIFont(name: "Avenir Black", size: 20)
        addressLabel.textColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Address Content
        scrollView.addSubview(addressContent)
        addressContent.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 50).isActive = true
        addressContent.topAnchor.constraint(equalTo: self.addressLabel.bottomAnchor).isActive = true
        addressContent.translatesAutoresizingMaskIntoConstraints = false
        
        addressContent.text = museum.address
        addressContent.font = UIFont(name: "Avenir Black", size: 16)
        addressContent.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        //Hours Label
        scrollView.addSubview(hoursLabel)
        hoursLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        hoursLabel.topAnchor.constraint(equalTo: self.addressContent.bottomAnchor, constant: 20).isActive = true
        hoursLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        hoursLabel.translatesAutoresizingMaskIntoConstraints = false
        
        hoursLabel.text = "Hours"
        hoursLabel.font = UIFont(name: "Avenir Black", size: 20)
        hoursLabel.textColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Days Labels
        scrollView.addSubview(sundayLabel)
        sundayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 50).isActive = true
        sundayLabel.topAnchor.constraint(equalTo: self.hoursLabel.bottomAnchor).isActive = true
        sundayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let sunday = museum.hours["Sunday"] else { return }
        sundayLabel.text = "Sunday: \(sunday)"
        sundayLabel.font = UIFont(name: "Avenir Black", size: 16)
        sundayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        scrollView.addSubview(mondayLabel)
        mondayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 50).isActive = true
        mondayLabel.topAnchor.constraint(equalTo: self.sundayLabel.bottomAnchor).isActive = true
        mondayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let monday = museum.hours["Monday"] else { return }
        mondayLabel.text = "Monday: \(monday)"
        mondayLabel.font = UIFont(name: "Avenir Black", size: 16)
        mondayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        scrollView.addSubview(tuesdayLabel)
        tuesdayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 50).isActive = true
        tuesdayLabel.topAnchor.constraint(equalTo: self.mondayLabel.bottomAnchor).isActive = true
        tuesdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let tuesday = museum.hours["Tuesday"] else { return }
        tuesdayLabel.text = "Tuesday: \(tuesday)"
        tuesdayLabel.font = UIFont(name: "Avenir Black", size: 16)
        tuesdayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        scrollView.addSubview(wednesdayLabel)
        wednesdayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 50).isActive = true
        wednesdayLabel.topAnchor.constraint(equalTo: self.tuesdayLabel.bottomAnchor).isActive = true
        wednesdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let wednesday = museum.hours["Wednesday"] else { return }
        wednesdayLabel.text = "Wednesday: \(wednesday)"
        wednesdayLabel.font = UIFont(name: "Avenir Black", size: 16)
        wednesdayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        scrollView.addSubview(thursdayLabel)
        thursdayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 50).isActive = true
        thursdayLabel.topAnchor.constraint(equalTo: self.wednesdayLabel.bottomAnchor).isActive = true
        thursdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let thursday = museum.hours["Thursday"] else { return }
        thursdayLabel.text = "Thursday: \(thursday)"
        thursdayLabel.font = UIFont(name: "Avenir Black", size: 16)
        thursdayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        scrollView.addSubview(fridayLabel)
        fridayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 50).isActive = true
        fridayLabel.topAnchor.constraint(equalTo: self.thursdayLabel.bottomAnchor).isActive = true
        fridayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let friday = museum.hours["Friday"] else { return }
        fridayLabel.text = "Friday: \(friday)"
        fridayLabel.font = UIFont(name: "Avenir Black", size: 16)
        fridayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        scrollView.addSubview(saturdayLabel)
        saturdayLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 50).isActive = true
        saturdayLabel.topAnchor.constraint(equalTo: self.fridayLabel.bottomAnchor).isActive = true
        saturdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let saturday = museum.hours["Saturday"] else { return }
        saturdayLabel.text = "Saturday: \(saturday)"
        saturdayLabel.font = UIFont(name: "Avenir Black", size: 16)
        saturdayLabel.textColor = UIColor(named: UIColor.ColorName.darkBlue)
        
        
        //Intervior View Label // Add only if museum has street view
        if self.museum.interiorMapView == true {
            
            seeInsideButton = UIButton(type: .custom)
            seeInsideButton.addTarget(self, action: #selector(self.onGoToInteriorView), for: UIControlEvents.touchUpInside)
            scrollView.addSubview(seeInsideButton)
            seeInsideButton.heightAnchor.constraint(equalToConstant: 20)
            seeInsideButton.topAnchor.constraint(equalTo: self.saturdayLabel.bottomAnchor, constant: 20).isActive = true
            seeInsideButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            seeInsideButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
            seeInsideButton.translatesAutoresizingMaskIntoConstraints = false
            
            seeInsideButton.setTitle("See 360° Gallery View", for: .normal)
            seeInsideButton.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
            seeInsideButton.tintColor = UIColor.white
            seeInsideButton.titleLabel?.font = UIFont(name: "Avenir Black", size: 20)
            
            //Website Label
            websiteButton = UIButton(type: .custom)
            websiteButton.addTarget(self, action: #selector(self.onGoToWebView), for: UIControlEvents.touchUpInside)
            scrollView.addSubview(websiteButton)
            websiteButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            websiteButton.topAnchor.constraint(equalTo: self.seeInsideButton.bottomAnchor, constant: 20).isActive = true
            websiteButton.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -20).isActive = true
            websiteButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
            websiteButton.translatesAutoresizingMaskIntoConstraints = false
            
            websiteButton.setTitle("See Website", for: .normal)
            websiteButton.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
            websiteButton.tintColor = UIColor.white
            websiteButton.titleLabel?.font = UIFont(name: "Avenir Black", size: 20)
            
        } else {
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
    }
    
    
    // MARK: Show Info Button Functions
    
    func onGoToWebView(){
        self.delegate?.goToWebView()
    }
    
    func onGoToInteriorView(){
        self.delegate?.goToInteriorView()
    }
    
    func goBack(){
        self.backDelegate?.goBack()
    }
    
    func showArtWork(){
        self.delegate?.showArtWork()
    }
    
    
}
