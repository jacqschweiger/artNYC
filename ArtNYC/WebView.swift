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
    func goForward(_: AnyObject)
    func doRefresh(_: AnyObject)
    func openInBrowser(_: AnyObject)
    func doGoBack(_: AnyObject)
}

protocol BackDelegate: class {
    func goBack()
}

class WebView: UIView {
    
    weak var delegate: WebViewDelegate?
    weak var backDelegate: BackDelegate?
    var museum: Museum!
    var museumWebView: UIWebView!
    var backButton = UIButton()
    var webNavBar = UIToolbar()
    
    
    init(frame:CGRect, museum: Museum){
        super.init(frame: frame)
        self.museum = museum
        self.backgroundColor = UIColor.white
        
        setUpBackButton()
        setUpWebView()
        setUpWebNavBar()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpWebView(){
        museumWebView = UIWebView()
        self.addSubview(museumWebView)
        self.sendSubview(toBack: museumWebView)
        museumWebView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        museumWebView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        museumWebView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        museumWebView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        museumWebView.translatesAutoresizingMaskIntoConstraints = false
        museumWebView.backgroundColor = UIColor.white
        
        DispatchQueue.main.async {
            let url = NSURL(string: self.museum.url)
            let request = NSURLRequest(url: url as! URL)
            self.museumWebView.loadRequest(request as URLRequest)
        }
    }
    
    func setUpBackButton(){
        self.addSubview(backButton)
        self.backButton.setImage(UIImage(named: "circleBack"), for: .normal)
        self.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        self.backButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        self.backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        self.backButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        self.backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.backButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpWebNavBar (){
        
        let backButton = UIButton()
        backButton.frame = CGRect(x: 0, y: 0, width: 10, height: 20)
        backButton.setImage(UIImage(named: "Back Icon"), for: .normal)
        backButton.addTarget(self, action: #selector(doGoBack), for: .touchUpInside)
        
        let backBarButton = UIBarButtonItem()
        backBarButton.customView = backButton
        
        let forwardButton = UIButton()
        forwardButton.frame = CGRect(x: 0, y: 0, width: 10, height: 20)
        forwardButton.setImage(UIImage(named: "Forward Icon"), for: .normal)
        forwardButton.addTarget(self, action: #selector(goForward), for: .touchUpInside)
        
        let forwardBarButton = UIBarButtonItem()
        forwardBarButton.customView = forwardButton
        
        let refreshButton = UIButton()
        refreshButton.frame = CGRect(x: 0, y: 0, width: 18, height: 20)
        refreshButton.setImage(UIImage(named: "Refresh Icon"), for: .normal)
        refreshButton.addTarget(self, action: #selector(doRefresh), for: .touchUpInside)
        
        let refreshBarButton = UIBarButtonItem()
        refreshBarButton.customView = refreshButton
        
        let openButton = UIButton()
        openButton.frame = CGRect(x: 0, y: 0, width: 18, height: 25)
        openButton.setImage(UIImage(named: "Open Icon"), for: .normal)
        openButton.addTarget(self, action: #selector(openInBrowser), for: .touchUpInside)
        
        let openBarButton = UIBarButtonItem()
        openBarButton.customView = openButton
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let webNavBarButtons: [UIBarButtonItem] = [backBarButton, spacer, forwardBarButton, spacer, refreshBarButton, spacer, openBarButton]
        
        self.addSubview(webNavBar)
        self.webNavBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.webNavBar.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.webNavBar.translatesAutoresizingMaskIntoConstraints = false
        self.webNavBar.setItems(webNavBarButtons, animated: false)
        self.webNavBar.barTintColor = UIColor(named: UIColor.ColorName.turquoise)
    }
    
    func goBack(){
        self.backDelegate?.goBack()
    }
    
    // MARK: WebView Navigation Functions
    
    func doGoBack(){
        self.delegate?.doGoBack(UIBarButtonItem.self)
    }
    
    func goForward(){
        self.delegate?.goForward(UIBarButtonItem.self)
    }
    
    func doRefresh(){
        self.delegate?.doRefresh(UIBarButtonItem.self)
    }
    
    func openInBrowser(){
        self.delegate?.openInBrowser(UIBarButtonItem.self)
    }
    
}







