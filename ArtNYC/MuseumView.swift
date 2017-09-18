//
//  MuseumView.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 2/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

protocol MuseumViewDelegate: class {
    func goToDetailView()
    func showFilter()
}

class MuseumView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var museums: [Museum] = []
    var museumCollectionView: UICollectionView!
    let header = UILabel()
    let searchController = UISearchController(searchResultsController: nil)
    var selectedMuseum: Museum!
    var filterButton = UIButton()
    weak var delegate: MuseumViewDelegate?
    var store = MuseumDataStore.sharedInstance
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        let cvLayout = UICollectionViewFlowLayout()
        cvLayout.itemSize = CGSize(width: 100, height: 100)

        museumCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: cvLayout)
        
        self.museumCollectionView.delegate = self
        self.museumCollectionView.dataSource = self
        
        museumCollectionView.register(MuseumCell.self, forCellWithReuseIdentifier: "basicCell")
        
        setUpElements()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpElements(){
        
        //Search Set Up
        self.addSubview(searchController.searchBar)
        searchController.searchBar.isHidden = true
        
        //Header Set Up
        self.addSubview(header)
        self.header.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        self.header.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.07).isActive = true
        self.header.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.header.translatesAutoresizingMaskIntoConstraints = false
        
        header.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        header.text = "ART MUSEUMS"
        header.font = UIFont(name: "Avenir", size: 18)
        header.textAlignment = .center
        header.textColor = UIColor.white

        
        self.addSubview(museumCollectionView)
        self.museumCollectionView.topAnchor.constraint(equalTo: self.header.bottomAnchor).isActive = true
        self.museumCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.museumCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.museumCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.museumCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.museumCollectionView.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        
        //Filter Set Up
        self.insertSubview(filterButton, aboveSubview: header)
        self.filterButton.setTitle("•••", for: .normal)
        self.filterButton.addTarget(self, action: #selector(showSearch), for: .touchUpInside)
        
        self.filterButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        self.filterButton.centerYAnchor.constraint(equalTo: self.header.centerYAnchor).isActive = true
        self.filterButton.translatesAutoresizingMaskIntoConstraints = false
    }

    func showFilter(){
        self.delegate?.showFilter()
    }
    
    func showSearch(){
        searchController.searchBar.isHidden = false
    }
    
    //Search Controller Functions
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return self.searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        
        return self.searchController.isActive && !searchBarIsEmpty()
    }
    
    func noSearchText()-> Bool {
        return self.searchController.isActive && self.searchBarIsEmpty()
    }
    
    
}

//MARK:- CollectionView Delegate and DataSource
extension MuseumView {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isFiltering() {
            return self.store.filteredMuseums.count
        } else if noSearchText() {
            return self.store.allMuseums.count
        }
        return self.store.allMuseums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.museumCollectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath) as! MuseumCell
        let museum: Museum
        
        if isFiltering() {
            museum = self.store.filteredMuseums[indexPath.item]
        } else {
            museum = self.store.allMuseums[indexPath.item]
        }
        
        cell.titleLabel.text = museum.title
        if museum.title == "Metropolitan Museum of Art" {
            cell.titleLabel.text = "Metropolitan\nMuseum of Art"
        } else if museum.title == "Solomon R. Guggenheim Museum" {
            cell.titleLabel.text = "Solomon R. Guggenheim\n Museum"
        } else if museum.title == "Whitney Museum of American Art" {
            cell.titleLabel.text = "Whitney Museum of\nAmerican Art"
        }
        cell.titleLabel.numberOfLines = 0
        cell.imageView.image = museum.logo
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let museum: Museum
        
        if isFiltering() {
            museum = self.store.filteredMuseums[indexPath.item]
        } else {
            museum = self.museums[indexPath.item]
        }
        
        self.selectedMuseum = museum
        self.delegate?.goToDetailView()
    }
    
}

//MARK:- CollectionViewLayout
extension MuseumView {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionInsets = UIEdgeInsets(top: 11.5, left: 11.5, bottom: 60, right: 11.5)
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 150)
    }

}
