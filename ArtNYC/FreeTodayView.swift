//
//  FreeTodayView.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 8/21/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class FreeTodayView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var freeTodayCollectionView: UICollectionView!
    let header = UILabel()
    var museums: [Museum] = []
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        let cvLayout = UICollectionViewFlowLayout()
        cvLayout.itemSize = CGSize(width: 100, height: 100)
        
        freeTodayCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: cvLayout)
        
        freeTodayCollectionView.register(MuseumCell.self, forCellWithReuseIdentifier: "basicCell")
        
        self.freeTodayCollectionView.delegate = self
        self.freeTodayCollectionView.dataSource = self

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
        self.header.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.07).isActive = true
        self.header.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.header.translatesAutoresizingMaskIntoConstraints = false
        
        header.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        header.text = "FREE TODAY"
        header.font = UIFont(name: "Avenir", size: 18)
        header.textAlignment = .center
        header.textColor = UIColor.white
        
        
        self.addSubview(freeTodayCollectionView)
        self.freeTodayCollectionView.topAnchor.constraint(equalTo: self.header.bottomAnchor).isActive = true
        self.freeTodayCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.freeTodayCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.freeTodayCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.freeTodayCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.freeTodayCollectionView.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
    }


}

//MARK:- CollectionView Delegate and DataSource
extension FreeTodayView {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.museums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.freeTodayCollectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath) as! MuseumCell
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
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.selectedMuseum = self.museums[indexPath.row]
//        self.delegate?.goToDetailView()
//    }
    
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
