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
    func stop(_: AnyObject)
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
    var header = UIToolbar()
    var backButton: UIBarButtonItem!
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
        museumWebView.topAnchor.constraint(equalTo: self.header.bottomAnchor).isActive = true
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
        self.addSubview(header)
        self.header.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.header.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.header.translatesAutoresizingMaskIntoConstraints = false
        self.header.barTintColor = UIColor(named: UIColor.ColorName.turquoise)
        
        let backToDetailButton = UIButton()
        backToDetailButton.frame = CGRect(x: 0, y: 0, width: 10, height: 20)
        backToDetailButton.setImage(UIImage(named: "Back Icon"), for: .normal)
        backToDetailButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        let backToDetailBarButton = UIBarButtonItem()
        backToDetailBarButton.customView = backToDetailButton
        
        let headerItems: [UIBarButtonItem] = [backToDetailBarButton]
        self.header.setItems(headerItems, animated: false)
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







