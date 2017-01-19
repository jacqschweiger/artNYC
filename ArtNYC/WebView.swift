//
//  WebView.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 1/15/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

protocol WebViewDelegate: class {
    func goBack(_: AnyObject)
    func goForward(_: AnyObject)
    func doRefresh(_: AnyObject)
    func stop(_: AnyObject)
}

class WebView: UIView {
    
    weak var delegate: WebViewDelegate?
    var museumURL: String!
    var museumWebView: UIWebView!
    var header = UILabel()
    var webToolbar: UINavigationItem!
    var backButton: UIBarButtonItem!
    var toolbar = UIToolbar()
    
    init(frame:CGRect, museumURL: String){
        super.init(frame: frame)
        self.museumURL = museumURL
        self.backgroundColor = UIColor.white
        setUpWebView()
        setUpToolbar()
        reloadInputViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpWebView(){
        
        self.addSubview(header)
        self.header.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.header.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05).isActive = true
        self.header.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.header.translatesAutoresizingMaskIntoConstraints = false
        header.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        
        museumWebView = UIWebView()
        self.addSubview(museumWebView)
        museumWebView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        museumWebView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        museumWebView.topAnchor.constraint(equalTo: self.header.bottomAnchor).isActive = true
        museumWebView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        museumWebView.translatesAutoresizingMaskIntoConstraints = false
        museumWebView.backgroundColor = UIColor.white
        
        DispatchQueue.main.async {
            let url = NSURL(string: self.museumURL)
            let request = NSURLRequest(url: url as! URL)
            self.museumWebView.loadRequest(request as URLRequest)
        }
    }
    
    func setUpToolbar (){
        
        let backButton = UIButton()
        backButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        backButton.setImage(UIImage(named: "Back"), for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        let backBarButton = UIBarButtonItem()
        backBarButton.customView = backButton
        
        let forwardButton = UIButton()
        forwardButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        forwardButton.setImage(UIImage(named: "Forward"), for: .normal)
        forwardButton.addTarget(self, action: #selector(goForward), for: .touchUpInside)
        
        let forwardBarButton = UIBarButtonItem()
        forwardBarButton.customView = forwardButton
        
        let refreshButton = UIButton()
        refreshButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        refreshButton.setImage(UIImage(named: "Refresh"), for: .normal)
        refreshButton.addTarget(self, action: #selector(doRefresh), for: .touchUpInside)
        
        let refreshBarButton = UIBarButtonItem()
        refreshBarButton.customView = refreshButton
        
        let stopButton = UIButton()
        stopButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        stopButton.setImage(UIImage(named: "Stop"), for: .normal)
        stopButton.addTarget(self, action: #selector(stop), for: .touchUpInside)
        
        let stopBarButton = UIBarButtonItem()
        stopBarButton.customView = stopButton
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let toolbarButtons: [UIBarButtonItem] = [backBarButton, spacer, forwardBarButton, spacer, refreshBarButton, spacer, stopBarButton]
        
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
    
    // MARK: Toolbar Functions
    
    func goBack(){
        self.delegate?.goBack(UIBarButtonItem.self)
    }
    
    func goForward(){
        self.delegate?.goForward(UIBarButtonItem.self)
    }
    
    func doRefresh(){
        self.delegate?.doRefresh(UIBarButtonItem.self)
    }
    
    func stop(){
        self.delegate?.stop(UIBarButtonItem.self)
    }
}







