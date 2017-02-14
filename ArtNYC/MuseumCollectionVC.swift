//
//  MuseumCollectionVC.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 2/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class MuseumCollectionVC: UIViewController, MuseumCollectionViewDelegate, FilterVCDelegate {
    
    var store = MuseumDataStore.sharedInstance
    var museumCollectionView: MuseumCollectionView!
    var filterVC: FilterVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        self.museumCollectionView = MuseumCollectionView()
        self.museumCollectionView.delegate = self
        
        self.view = self.museumCollectionView
        
        self.filterVC = FilterVC()
        self.filterVC.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
        
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
        filterVC = FilterVC()
        filterVC.modalPresentationStyle = .overFullScreen
        filterVC.modalTransitionStyle = .crossDissolve
        self.present(filterVC, animated: true, completion: nil)
    }
    
    func reloadMuseums(){
        if store.filteredMuseums.count > 0 {
            self.museumCollectionView.museums = store.filteredMuseums
        } else if store.filteredMuseums.count == 0 {
            self.museumCollectionView.museums = store.allMuseums
        }
        self.museumCollectionView.museumCollectionView.reloadData()
    }
    
}
