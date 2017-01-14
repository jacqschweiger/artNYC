//
//  WebVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/14/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class WebVC: UIViewController {
    
    @IBOutlet weak var museumWebView: UIWebView!
    
    @IBAction func doRefresh(_: AnyObject) {
        museumWebView.reload()
    }
    
    @IBAction func goBack(_: AnyObject) {
        museumWebView.goBack()
    }
    
    @IBAction func goForward(_: AnyObject) {
        museumWebView.goForward()
    }
    
    @IBAction func stop(_: AnyObject) {
        museumWebView.stopLoading()
    }
    
    var museumURL: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            let url = NSURL(string: self.museumURL)
            let request = NSURLRequest(url: url as! URL)
            self.museumWebView.loadRequest(request as URLRequest)
        }
        
        self.reloadInputViews()
    }
    
}

    
