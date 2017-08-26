//
//  MuseumTableViewCell.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 8/22/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class MuseumTableViewCell : UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var museumCollectionView: UICollectionView!
    var store = MuseumDataStore.sharedInstance
    var selectedMuseum: Museum!
    weak var delegate: MuseumViewDelegate?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let cvLayout = UICollectionViewFlowLayout()
        cvLayout.scrollDirection = .horizontal
        cvLayout.itemSize = CGSize(width: 100, height: 100)
        
        museumCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: cvLayout)
        
        museumCollectionView.register(MuseumCell.self, forCellWithReuseIdentifier: "basicCell")
        
        setUpElements()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    func setUpElements() {
        
        self.addSubview(museumCollectionView)
        self.museumCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.museumCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.museumCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.museumCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.museumCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.museumCollectionView.backgroundColor = UIColor.black
    }
}

//MARK:- CollectionView Delegate and DataSource
extension MuseumTableViewCell {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.store.allMuseums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.museumCollectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath) as! MuseumCell
        let museums = self.store.allMuseums
        cell.imageView.image = museums[indexPath.item].logo
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedMuseum = self.store.allMuseums[indexPath.row]
        print("selected museum : \(self.selectedMuseum.title)")
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

