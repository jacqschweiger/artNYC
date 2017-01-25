//
//  WebView.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 1/15/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

protocol WebNavDelegate: class {
    func goForward(_: AnyObject)
    func doRefresh(_: AnyObject)
    func stop(_: AnyObject)
    func doGoBack(_: AnyObject)
}

protocol BackDelegate: class {
    func goBack()
}

class WebView: UIView {
    
    weak var delegate: WebNavDelegate?
    weak var backDelegate: BackDelegate?
    var museum: Museum!
    var museumWebView: UIWebView!
    var container = UIView()
    var backButton = UIButton()
    var webNavBar = UIToolbar()
    
    
    init(frame:CGRect, museum: Museum){
        super.init(frame: frame)
        self.museum = museum
        self.backgroundColor = UIColor.white
        
        setUpHeader()
        setUpWebView()
        setUpWebNavBar()

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
        museumWebView.topAnchor.constraint(equalTo: self.container.bottomAnchor).isActive = true
        museumWebView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        museumWebView.translatesAutoresizingMaskIntoConstraints = false
        museumWebView.backgroundColor = UIColor.white
        
        DispatchQueue.main.async {
            let url = NSURL(string: self.museum.url)
            let request = NSURLRequest(url: url as! URL)
            self.museumWebView.loadRequest(request as URLRequest)
        }
    }
    
    func setUpHeader(){
        //Header Container
        self.addSubview(container)
        self.container.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.container.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.container.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
        self.container.translatesAutoresizingMaskIntoConstraints = false
        self.container.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Back Button
        self.addSubview(backButton)
        self.backButton.setImage(UIImage(named: "Back Icon"), for: .normal)
        self.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        self.backButton.leftAnchor.constraint(equalTo: self.container.leftAnchor, constant: 15).isActive = true
        self.backButton.centerYAnchor.constraint(equalTo: self.container.centerYAnchor).isActive = true
        self.backButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.backButton.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
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
        
        let stopButton = UIButton()
        stopButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        stopButton.setImage(UIImage(named: "Stop Icon"), for: .normal)
        stopButton.addTarget(self, action: #selector(stop), for: .touchUpInside)
        
        let stopBarButton = UIBarButtonItem()
        stopBarButton.customView = stopButton
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let webNavBarButtons: [UIBarButtonItem] = [backBarButton, spacer, forwardBarButton, spacer, refreshBarButton, spacer, stopBarButton]
        
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
    
    func stop(){
        self.delegate?.stop(UIBarButtonItem.self)
    }
    
}







