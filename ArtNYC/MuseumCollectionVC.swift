//
//  MuseumCollectionVC.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 2/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class MuseumCollectionVC: UIViewController, MuseumCollectionViewDelegate {
    
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
    
    func goToDetailView(){
        let detailViewController = DetailVC()
        detailViewController.museum = self.museumCollectionView.selectedMuseum
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func showFilter(){
        let filterController = FilterVC()
        filterController.modalPresentationStyle = .overFullScreen
        filterController.modalTransitionStyle = .crossDissolve
        self.present(filterController, animated: true, completion: nil)
    }
}
