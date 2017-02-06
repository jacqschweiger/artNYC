//
//  MuseumCollectionView.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 2/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

protocol MuseumCollectionViewDelegate: class {
    func goToDetailView()
    func showFilter()
}

class MuseumCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var museums: [Museum] = []
    var museumCollectionView: UICollectionView!
    let header = UILabel()
    var selectedMuseum: Museum!
    var filterButton = UIButton()
    weak var delegate: MuseumCollectionViewDelegate?
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        let cvLayout = UICollectionViewFlowLayout()
        cvLayout.itemSize = CGSize(width: 100, height: 100)

        museumCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: cvLayout)
        
        self.museumCollectionView.delegate = self
        self.museumCollectionView.dataSource = self
        
        museumCollectionView.register(MuseumCollectionViewCell.self, forCellWithReuseIdentifier: "basicCell")
        
        setUpElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpElements(){
        
        let filler = UILabel()
        self.addSubview(filler)
        filler.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        filler.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        filler.heightAnchor.constraint(equalToConstant: 15).isActive = true
        filler.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        filler.translatesAutoresizingMaskIntoConstraints = false
        
        //Header Set Up
        self.addSubview(header)
        self.header.topAnchor.constraint(equalTo: filler.bottomAnchor).isActive = true
        self.header.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05).isActive = true
        self.header.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.header.translatesAutoresizingMaskIntoConstraints = false
        
        header.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        header.text = "Art Museums"
        header.font = UIFont(name: "Avenir Black", size: 18)
        header.textAlignment = .center
        header.textColor = UIColor.white

        
        self.addSubview(museumCollectionView)
        self.museumCollectionView.topAnchor.constraint(equalTo: self.header.bottomAnchor).isActive = true
        self.museumCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.museumCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.museumCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.museumCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.museumCollectionView.backgroundColor = UIColor(named: UIColor.ColorName.grey)
        
        //Filter Set Up
        self.insertSubview(filterButton, aboveSubview: header)
        self.filterButton.setTitle("•••", for: .normal)
        self.filterButton.addTarget(self, action: #selector(showFilter), for: .touchUpInside)
        
        self.filterButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        self.filterButton.centerYAnchor.constraint(equalTo: self.header.centerYAnchor).isActive = true
        self.filterButton.translatesAutoresizingMaskIntoConstraints = false

    }

    func showFilter(){
        self.delegate?.showFilter()
    }
    
}

//MARK:- CollectionView Delegate and DataSource
extension MuseumCollectionView {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.museums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.museumCollectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath) as! MuseumCollectionViewCell
        cell.titleLabel.text = museums[indexPath.item].title
        if museums[indexPath.item].title == "Metropolitan Museum of Art" {
            cell.titleLabel.text = "Metropolitan\nMuseum of Art"
        } else if museums[indexPath.item].title == "Solomon R. Guggenheim Museum" {
            cell.titleLabel.text = "Solomon R. Guggenheim\n Museum"
        } else if museums[indexPath.item].title == "Whitney Museum of American Art" {
            cell.titleLabel.text = "Whitney Museum of\nAmerican Art"
        }
        cell.titleLabel.numberOfLines = 0
        cell.imageView.image = self.museums[indexPath.item].logo
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedMuseum = self.museums[indexPath.row]
        self.delegate?.goToDetailView()
    }
    
}

//MARK:- CollectionViewLayout
extension MuseumCollectionView {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionInsets = UIEdgeInsets(top: 10, left: 15, bottom: 100, right: 15)
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let blockSize = CGSize(width: 170, height: 150)
        return blockSize
    }
    
}
