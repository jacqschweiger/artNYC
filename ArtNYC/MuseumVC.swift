//
//  MuseumVC.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 2/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit
import GooglePlaces
import FirebaseDatabase

class MuseumVC: UIViewController, MuseumViewDelegate, FilterVCDelegate {
    
    var store = MuseumDataStore.sharedInstance
    var museumView: MuseumView!
    var filterVC: FilterVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.ref.observe(.value, with: { (snapshot) in
            var fbMuseums: [Museum] = []
            
            print("snapshot: \(snapshot)")
            
//            for item in snapshot.children {
//                let newFBMuseum = Museum(snapshot: item as! FIRDataSnapshot)
//                fbMuseums.append(newFBMuseum)
//            }
        })
    }
    
    //
//    ref.observe(.value, with: { snapshot in
//    // 2
//    var newItems: [GroceryItem] = []
//    
//    // 3
//    for item in snapshot.children {
//    // 4
//    let groceryItem = GroceryItem(snapshot: item as! FIRDataSnapshot)
//    newItems.append(groceryItem)
//    }
//    
//    // 5
//    self.items = newItems
//    self.tableView.reloadData()
//    })
    
    override func loadView() {
        self.museumView = MuseumView()
        self.museumView.delegate = self
        
        self.view = self.museumView
        
        self.filterVC = FilterVC()
        self.filterVC.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
        if store.filteredMuseums.count > 0 {
            self.museumView.museums = store.filteredMuseums
        } else if store.filteredMuseums.count == 0 {
            self.museumView.museums = store.allMuseums
        }
    }
    
    func goToDetailView(){
        let detailViewController = DetailVC()
        detailViewController.museum = self.museumView.selectedMuseum
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func showFilter(){
        filterVC.modalPresentationStyle = .overFullScreen
        filterVC.modalTransitionStyle = .crossDissolve
        self.present(filterVC, animated: true, completion: nil)
    }
    
    func refreshMuseums(){
        if store.filteredMuseums.count > 0 {
            self.museumView.museums = store.filteredMuseums
        } else if store.filteredMuseums.count == 0 {
            self.museumView.museums = store.allMuseums
        }
        self.museumView.museumCollectionView.reloadData()
    }
    
}
