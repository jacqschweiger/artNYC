//
//  MuseumCollectionVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 2/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class MuseumCollectionVC: UIViewController {
    
    var store = MuseumDataStore.sharedInstance
    var museumCollectionView: MuseumCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.museumCollectionView = MuseumCollectionView(frame: CGRect.zero)
        self.view = self.museumCollectionView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
        self.view = museumCollectionView
        
        if store.filteredMuseums.count > 0 {
            self.museumCollectionView.museums = store.filteredMuseums
        } else if store.filteredMuseums.count == 0 {
            self.museumCollectionView.museums = store.allMuseums
        }
    }
}
