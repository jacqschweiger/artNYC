//
//  DetailVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/13/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class DetailVC: UIViewController, GMSMapViewDelegate, GoToWebViewDelegate {
    
    var store = MuseumDataStore.sharedInstance
    var museum: Museum?
    var detailView: DetailView!
    
    @IBOutlet weak var urlLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.delegate = self
    }

    override func loadView(){
        guard let museum = self.museum else { return }
        self.detailView = DetailView(frame: CGRect.zero, museum: museum)
        self.view = self.detailView
    }
    
    func goToWebView() {
        let webViewController = WebVC()
        if let museum = museum {
            webViewController.museumURL = museum.url
        }
        navigationController?.pushViewController(webViewController, animated: false)
    }
    
}
