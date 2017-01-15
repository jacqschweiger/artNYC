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

class DetailVC: UIViewController, GMSMapViewDelegate {
    
    var store = MuseumDataStore.sharedInstance
    var museum: Museum?
    var detailView: DetailView!
    
    @IBOutlet weak var urlLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func loadView(){
        guard let museum = self.museum else { return }
        self.detailView = DetailView(frame: CGRect.zero, museum: museum)
        self.view = self.detailView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let museum = self.museum else { return }
        if segue.identifier == "showWebView" {
            let dest = segue.destination as! WebVC
            dest.museumURL = museum.url
        }
    }
    
    
}
