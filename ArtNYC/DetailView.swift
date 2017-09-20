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
    var artCategoriesIcon = UIImageView()
    var artCategoriesContent = UILabel()
    var admissionIcon = UIImageView()
    var admissionContent = UILabel()
    var freeAdmissionIcon = UIImageView()
    var freeAdmissionContent = UILabel()
    var addressIcon = UIImageView()
    var addressContent = UILabel()
    var hoursIcon = UIImageView()
    var hoursContent = UILabel()
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
        self.titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
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
            titleLabel.text = "The Whitney"}
        else if museum.title == "Jacques Marchais Museum of Tibetan Art" {
            titleLabel.text = "Tibetan Museum"
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
            
            //Art Categories Icon
            scrollView.addSubview(artCategoriesIcon)
            artCategoriesIcon.image = UIImage(named: "paintbrush_icon")
            artCategoriesIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(Constants.widthSpace)).isActive = true
            artCategoriesIcon.topAnchor.constraint(equalTo: self.seeInsideButton.bottomAnchor, constant: 20).isActive = true
            artCategoriesIcon.widthAnchor.constraint(equalToConstant: 35).isActive = true
            artCategoriesIcon.heightAnchor.constraint(equalToConstant: 35).isActive = true
            artCategoriesIcon.translatesAutoresizingMaskIntoConstraints = false
            
        } else {
            
            //Art Categories Icon
            scrollView.addSubview(artCategoriesIcon)
            artCategoriesIcon.image = UIImage(named: "paintbrush_icon")
            artCategoriesIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(Constants.widthSpace)).isActive = true
            artCategoriesIcon.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20).isActive = true
            artCategoriesIcon.widthAnchor.constraint(equalToConstant: 35).isActive = true
            artCategoriesIcon.heightAnchor.constraint(equalToConstant: 35).isActive = true
            artCategoriesIcon.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
        
        //Art Categories Content
        scrollView.addSubview(artCategoriesContent)
        artCategoriesContent.leftAnchor.constraint(equalTo: self.artCategoriesIcon.rightAnchor, constant: 20).isActive = true
        artCategoriesContent.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        artCategoriesContent.centerYAnchor.constraint(equalTo: self.artCategoriesIcon.centerYAnchor).isActive = true
        artCategoriesContent.translatesAutoresizingMaskIntoConstraints = false
        
        artCategoriesContent.text = museum.artCategories
        artCategoriesContent.font = UIFont(name: "Avenir", size: 16)
        artCategoriesContent.numberOfLines = 0
        
        
        //Admission Icon
        scrollView.addSubview(admissionIcon)
        admissionIcon.image = UIImage(named: "dollar_icon")
        admissionIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(Constants.widthSpace)).isActive = true
        admissionIcon.topAnchor.constraint(equalTo: self.artCategoriesContent.bottomAnchor, constant: CGFloat(Constants.verticalSpace)).isActive = true
        admissionIcon.widthAnchor.constraint(equalToConstant: 35).isActive = true
        admissionIcon.heightAnchor.constraint(equalToConstant: 35).isActive = true
        admissionIcon.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Admission Content
        scrollView.addSubview(admissionContent)
        admissionContent.leftAnchor.constraint(equalTo: self.artCategoriesIcon.rightAnchor, constant: 20).isActive = true
        admissionContent.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        admissionContent.centerYAnchor.constraint(equalTo: self.admissionIcon.centerYAnchor).isActive = true
        admissionContent.translatesAutoresizingMaskIntoConstraints = false
        
        admissionContent.text = museum.ticketPrice
        admissionContent.font = UIFont(name: "Avenir", size: 16)
        admissionContent.numberOfLines = 0
        
        //Free Admission Icon
        scrollView.addSubview(freeAdmissionIcon)
        freeAdmissionIcon.image = UIImage(named: "free_icon")
        freeAdmissionIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(Constants.widthSpace)).isActive = true
        freeAdmissionIcon.topAnchor.constraint(equalTo: admissionContent.bottomAnchor, constant: CGFloat(Constants.verticalSpace)).isActive = true
        freeAdmissionIcon.widthAnchor.constraint(equalToConstant: 35).isActive = true
        freeAdmissionIcon.heightAnchor.constraint(equalToConstant: 35).isActive = true
        freeAdmissionIcon.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Free Admission Content
        scrollView.addSubview(freeAdmissionContent)
        freeAdmissionContent.leftAnchor.constraint(equalTo: self.freeAdmissionIcon.rightAnchor, constant: 20).isActive = true
        freeAdmissionContent.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        freeAdmissionContent.centerYAnchor.constraint(equalTo: self.freeAdmissionIcon.centerYAnchor).isActive = true
        freeAdmissionContent.translatesAutoresizingMaskIntoConstraints = false
        
        freeAdmissionContent.text = museum.freeHours
        freeAdmissionContent.font = UIFont(name: "Avenir", size: 16)
        freeAdmissionContent.numberOfLines = 0
        
        
        //Address Icon
        scrollView.addSubview(addressIcon)
        addressIcon.image = UIImage(named: "map_icon")
        addressIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(Constants.widthSpace)).isActive = true
        addressIcon.topAnchor.constraint(equalTo: freeAdmissionContent.bottomAnchor, constant: CGFloat(Constants.verticalSpace)).isActive = true
        addressIcon.widthAnchor.constraint(equalToConstant: 35).isActive = true
        addressIcon.heightAnchor.constraint(equalToConstant: 35).isActive = true
        addressIcon.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Address Content
        scrollView.addSubview(addressContent)
        addressContent.leftAnchor.constraint(equalTo: self.addressIcon.rightAnchor, constant: 20).isActive = true
        addressContent.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        addressContent.centerYAnchor.constraint(equalTo: self.addressIcon.centerYAnchor).isActive = true
        addressContent.translatesAutoresizingMaskIntoConstraints = false
        
        addressContent.text = museum.address
        addressContent.font = UIFont(name: "Avenir", size: 16)
        addressContent.numberOfLines = 0
        
        
        //Hours Icon
        scrollView.addSubview(hoursIcon)
        hoursIcon.image = UIImage(named: "clock_icon")
        hoursIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: CGFloat(Constants.widthSpace)).isActive = true
        hoursIcon.topAnchor.constraint(equalTo: addressContent.bottomAnchor, constant: CGFloat(Constants.verticalSpace)).isActive = true
        hoursIcon.widthAnchor.constraint(equalToConstant: 35).isActive = true
        hoursIcon.heightAnchor.constraint(equalToConstant: 35).isActive = true
        hoursIcon.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Hours Content
        scrollView.addSubview(hoursContent)
        hoursContent.leftAnchor.constraint(equalTo: self.hoursIcon.rightAnchor, constant: 20).isActive = true
        hoursContent.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        hoursContent.topAnchor.constraint(equalTo: self.hoursIcon.topAnchor).isActive = true
        hoursContent.translatesAutoresizingMaskIntoConstraints = false
        
        hoursContent.text = museum.hours
        hoursContent.font = UIFont(name: "Avenir", size: 16)
        hoursContent.numberOfLines = 0
        
        //Website Label
        websiteButton = UIButton(type: .custom)
        websiteButton.addTarget(self, action: #selector(self.onGoToWebView), for: UIControlEvents.touchUpInside)
        scrollView.addSubview(websiteButton)
        websiteButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        websiteButton.topAnchor.constraint(equalTo: self.hoursContent.bottomAnchor, constant: 20).isActive = true
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
