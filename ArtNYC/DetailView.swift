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
    var backButton = UIButton()
    var scrollView = UIScrollView()
    var titleLabel = UILabel()
    var seeInsideButton = UIButton()
    var artCategoriesLabel = UIImageView()
    var artCategoriesContent = UILabel()
    var admissionLabel = UIImageView()
    var admissionContent = UILabel()
    var freeAdmissionLabel = UIImageView()
    var freeAdmissionContent = UILabel()
    var addressLabel = UIImageView()
    var addressContent = UILabel()
    var hoursLabel = UIImageView()
    var sundayLabel = UILabel()
    var mondayLabel = UILabel()
    var tuesdayLabel = UILabel()
    var wednesdayLabel = UILabel()
    var thursdayLabel = UILabel()
    var fridayLabel = UILabel()
    var saturdayLabel = UILabel()
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
        self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        titleLabel.font = UIFont(name: "Avenir", size: 28)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.white
        titleLabel.numberOfLines = 0
        
        if museum.title == "The Metropolitan Museum of Art" {
            titleLabel.text = "The Met"
        } else if museum.title == "Solomon R. Guggenheim Museum" {
            titleLabel.text = "The Guggenheim"
        } else if museum.title == "Whitney Museum of American Art" {
            titleLabel.text = "The Whitney"
        } else {
            titleLabel.text = museum.title
        }
        
        //Intervior View Label // Add only if museum has street view
        if self.museum.interiorMapView == true {
            
            seeInsideButton = UIButton(type: .custom)
            seeInsideButton.addTarget(self, action: #selector(self.onGoToInteriorView), for: UIControlEvents.touchUpInside)
            scrollView.addSubview(seeInsideButton)
            seeInsideButton.heightAnchor.constraint(equalToConstant: 20)
            seeInsideButton.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20).isActive = true
            seeInsideButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            seeInsideButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
            seeInsideButton.translatesAutoresizingMaskIntoConstraints = false
            
            seeInsideButton.setTitle("See 360° Gallery View", for: .normal)
            seeInsideButton.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
            seeInsideButton.tintColor = UIColor.white
            seeInsideButton.titleLabel?.font = UIFont(name: "Avenir", size: 20)
            seeInsideButton.layer.cornerRadius = 5
            
            //Art Categories Label
            scrollView.addSubview(artCategoriesLabel)
            artCategoriesLabel.image = UIImage(named: "paintbrush_icon")
            artCategoriesLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(Constants.widthSpace)).isActive = true
            artCategoriesLabel.topAnchor.constraint(equalTo: self.seeInsideButton.bottomAnchor, constant: 20).isActive = true
            artCategoriesLabel.widthAnchor.constraint(equalToConstant: 35).isActive = true
            artCategoriesLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
            artCategoriesLabel.translatesAutoresizingMaskIntoConstraints = false
            
        } else {
            
            //Art Categories Label
            scrollView.addSubview(artCategoriesLabel)
            artCategoriesLabel.image = UIImage(named: "paintbrush_icon")
            artCategoriesLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(Constants.widthSpace)).isActive = true
            artCategoriesLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20).isActive = true
            artCategoriesLabel.widthAnchor.constraint(equalToConstant: 35).isActive = true
            artCategoriesLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
            artCategoriesLabel.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
        
        //Art Categories Content
        scrollView.addSubview(artCategoriesContent)
        artCategoriesContent.leftAnchor.constraint(equalTo: self.artCategoriesLabel.rightAnchor, constant: 20).isActive = true
        artCategoriesContent.centerYAnchor.constraint(equalTo: self.artCategoriesLabel.centerYAnchor).isActive = true
        artCategoriesContent.translatesAutoresizingMaskIntoConstraints = false
        
        artCategoriesContent.text = museum.artCategories
        artCategoriesContent.font = UIFont(name: "Avenir", size: 16)
        
        //Admission Label
        scrollView.addSubview(admissionLabel)
        admissionLabel.image = UIImage(named: "dollar_icon")
        admissionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(Constants.widthSpace)).isActive = true
        admissionLabel.topAnchor.constraint(equalTo: self.artCategoriesContent.bottomAnchor, constant: CGFloat(Constants.verticalSpace)).isActive = true
        admissionLabel.widthAnchor.constraint(equalToConstant: 35).isActive = true
        admissionLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        admissionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Admission Content
        scrollView.addSubview(admissionContent)
        admissionContent.leftAnchor.constraint(equalTo: self.artCategoriesLabel.rightAnchor, constant: 20).isActive = true
        admissionContent.centerYAnchor.constraint(equalTo: self.admissionLabel.centerYAnchor).isActive = true
        admissionContent.translatesAutoresizingMaskIntoConstraints = false
        
        admissionContent.text = museum.ticketPrice
        admissionContent.font = UIFont(name: "Avenir", size: 16)
        admissionContent.numberOfLines = 0
        
        //Free Admission Label
        scrollView.addSubview(freeAdmissionLabel)
        freeAdmissionLabel.image = UIImage(named: "paintbrush_icon")
        freeAdmissionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(Constants.widthSpace)).isActive = true
        freeAdmissionLabel.topAnchor.constraint(equalTo: admissionContent.bottomAnchor, constant: CGFloat(Constants.verticalSpace)).isActive = true
        freeAdmissionLabel.widthAnchor.constraint(equalToConstant: 35).isActive = true
        freeAdmissionLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        freeAdmissionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Free Admission Content
        scrollView.addSubview(freeAdmissionContent)
        freeAdmissionContent.leftAnchor.constraint(equalTo: self.freeAdmissionLabel.rightAnchor, constant: 20).isActive = true
        freeAdmissionContent.centerYAnchor.constraint(equalTo: self.freeAdmissionLabel.centerYAnchor).isActive = true
        freeAdmissionContent.translatesAutoresizingMaskIntoConstraints = false
        
        freeAdmissionContent.numberOfLines = 0
        freeAdmissionContent.text = museum.freeHours
        freeAdmissionContent.font = UIFont(name: "Avenir", size: 16)
        freeAdmissionContent.numberOfLines = 0
        
        
        //Address Label
        scrollView.addSubview(addressLabel)
        addressLabel.image = UIImage(named: "map_icon")
        addressLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(Constants.widthSpace)).isActive = true
        addressLabel.topAnchor.constraint(equalTo: freeAdmissionContent.bottomAnchor, constant: CGFloat(Constants.verticalSpace)).isActive = true
        addressLabel.widthAnchor.constraint(equalToConstant: 35).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Address Content
        scrollView.addSubview(addressContent)
        addressContent.leftAnchor.constraint(equalTo: self.addressLabel.rightAnchor, constant: 20).isActive = true
        addressContent.centerYAnchor.constraint(equalTo: self.addressLabel.centerYAnchor).isActive = true
        addressContent.translatesAutoresizingMaskIntoConstraints = false
        
        addressContent.text = museum.address
        addressContent.font = UIFont(name: "Avenir", size: 16)
        addressContent.numberOfLines = 0
        
        
        //Hours Label
        scrollView.addSubview(hoursLabel)
        hoursLabel.image = UIImage(named: "clock_icon")
        hoursLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(Constants.widthSpace)).isActive = true
        hoursLabel.topAnchor.constraint(equalTo: addressContent.bottomAnchor, constant: CGFloat(Constants.verticalSpace)).isActive = true
        hoursLabel.widthAnchor.constraint(equalToConstant: 35).isActive = true
        hoursLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        hoursLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Days Labels
        scrollView.addSubview(sundayLabel)
        
        sundayLabel.leftAnchor.constraint(equalTo: self.hoursLabel.rightAnchor, constant: 20).isActive = true
        sundayLabel.centerYAnchor.constraint(equalTo: self.hoursLabel.centerYAnchor).isActive = true
        sundayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let sunday = museum.hours["Sunday"] else { return }
        sundayLabel.text = "Sunday: \(sunday)"
        sundayLabel.font = UIFont(name: "Avenir", size: 16)
        
        
        
        scrollView.addSubview(mondayLabel)
        mondayLabel.leftAnchor.constraint(equalTo: self.sundayLabel.leftAnchor).isActive = true
        mondayLabel.topAnchor.constraint(equalTo: self.sundayLabel.bottomAnchor).isActive = true
        mondayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let monday = museum.hours["Monday"] else { return }
        mondayLabel.text = "Monday: \(monday)"
        mondayLabel.font = UIFont(name: "Avenir", size: 16)
        
        
        
        scrollView.addSubview(tuesdayLabel)
        tuesdayLabel.leftAnchor.constraint(equalTo: self.sundayLabel.leftAnchor).isActive = true
        tuesdayLabel.topAnchor.constraint(equalTo: self.mondayLabel.bottomAnchor).isActive = true
        tuesdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let tuesday = museum.hours["Tuesday"] else { return }
        tuesdayLabel.text = "Tuesday: \(tuesday)"
        tuesdayLabel.font = UIFont(name: "Avenir", size: 16)
        
        
        
        scrollView.addSubview(wednesdayLabel)
        wednesdayLabel.leftAnchor.constraint(equalTo: self.sundayLabel.leftAnchor).isActive = true
        wednesdayLabel.topAnchor.constraint(equalTo: self.tuesdayLabel.bottomAnchor).isActive = true
        wednesdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let wednesday = museum.hours["Wednesday"] else { return }
        wednesdayLabel.text = "Wednesday: \(wednesday)"
        wednesdayLabel.font = UIFont(name: "Avenir", size: 16)
        
        
        
        scrollView.addSubview(thursdayLabel)
        thursdayLabel.leftAnchor.constraint(equalTo: self.sundayLabel.leftAnchor).isActive = true
        thursdayLabel.topAnchor.constraint(equalTo: self.wednesdayLabel.bottomAnchor).isActive = true
        thursdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let thursday = museum.hours["Thursday"] else { return }
        thursdayLabel.text = "Thursday: \(thursday)"
        thursdayLabel.font = UIFont(name: "Avenir", size: 16)
        
        
        
        scrollView.addSubview(fridayLabel)
        fridayLabel.leftAnchor.constraint(equalTo: self.sundayLabel.leftAnchor).isActive = true
        fridayLabel.topAnchor.constraint(equalTo: self.thursdayLabel.bottomAnchor).isActive = true
        fridayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let friday = museum.hours["Friday"] else { return }
        fridayLabel.text = "Friday: \(friday)"
        fridayLabel.font = UIFont(name: "Avenir", size: 16)
        
        
        
        scrollView.addSubview(saturdayLabel)
        saturdayLabel.leftAnchor.constraint(equalTo: self.sundayLabel.leftAnchor).isActive = true
        saturdayLabel.topAnchor.constraint(equalTo: self.fridayLabel.bottomAnchor).isActive = true
        saturdayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let saturday = museum.hours["Saturday"] else { return }
        saturdayLabel.text = "Saturday: \(saturday)"
        saturdayLabel.font = UIFont(name: "Avenir", size: 16)
        
        
        
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
        websiteButton.titleLabel?.font = UIFont(name: "Avenir", size: 20)
        websiteButton.layer.cornerRadius = 5
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
