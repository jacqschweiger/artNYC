//
//  WebView.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/15/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class WebView: UIView {
    
    var museumURL: String!
    var museumWebView: UIWebView!
    var webToolbar: UINavigationItem!
    var backButton: UIBarButtonItem!
    
    init(frame:CGRect, museumURL: String){
        super.init(frame: frame)
        self.museumURL = museumURL
        self.backgroundColor = UIColor.white
        setUpWebView()
        reloadInputViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpWebView(){
        
        museumWebView = UIWebView()
        self.addSubview(museumWebView)
        museumWebView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        museumWebView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        museumWebView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        museumWebView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        museumWebView.translatesAutoresizingMaskIntoConstraints = false
        museumWebView.backgroundColor = UIColor.white
        
        DispatchQueue.main.async {
            let url = NSURL(string: self.museumURL)
            let request = NSURLRequest(url: url as! URL)
            self.museumWebView.loadRequest(request as URLRequest)
        }
    }
    
//    func setUpToolbar() {
//        webToolbar = UINavigationItem()
//        self.addSubview(webToolbar)
//        webToolbar.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        webToolbar.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        webToolbar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        webToolbar.translatesAutoresizingMaskIntoConstraints = false
//        
//        //Back Button
//        backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(goBack))
        
//        backButton.leftAnchor.constraint(equalTo: self.admissionLabel.rightAnchor).isActive = true
//        backButton.centerYAnchor.constraint(equalTo: self.websiteLabel.centerYAnchor).isActive = true
//        backButton.translatesAutoresizingMaskIntoConstraints = false
//        
//        backButton.setTitle(museum.url, for: .normal)
//        backButton.titleLabel?.font = UIFont(name: "Avenir Black", size: 14)!


//        // set font size of nav bar buttons
//        let labelFont: UIFont = UIFont(name: Constants.appFont.regular.rawValue, size: CGFloat(Constants.fontSize.xsmall.rawValue))!
//        let attributesTextNormal = [ NSFontAttributeName : labelFont ]
//        allStepsButton.setTitleTextAttributes(attributesTextNormal, for: .normal)
//        myMenuButton.setTitleTextAttributes(attributesTextNormal, for: UIControlState.normal)

        
        
        
        
    }
    


    
        
        

