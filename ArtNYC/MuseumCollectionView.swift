//
//  MuseumCollectionView.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 2/1/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import UIKit

class MuseumCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var museums: [Museum] = []
    var collectionView: UICollectionView!
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        let layoutA = UICollectionViewFlowLayout()
        layoutA.itemSize = CGSize(width: 100, height: 100)

        collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layoutA)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        collectionView.register(MuseumCollectionViewCell.self, forCellWithReuseIdentifier: "basicCell")
        
        setUpElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpElements(){
        self.addSubview(collectionView)
        self.collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.collectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.collectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

//MARK:- CollectionView Delegate and DataSource
extension MuseumCollectionView {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.museums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath) as! MuseumCollectionViewCell
        cell.titleLabel.text = museums[indexPath.item].title
        return cell
    }
}

//MARK:- CollectionViewLayout
extension MuseumCollectionView {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let verticalSpacing = Constants.gridLayout.HSInterCardVerticalSpacing.rawValue
        return verticalSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let horizontalSpacing = Constants.gridLayout.HSInterCardHorizontalSpacing.rawValue
        return horizontalSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionInsets = UIEdgeInsets(top: Constants.gridLayout.HSGridTopMargin.rawValue, left: Constants.gridLayout.HSGridSideMargin.rawValue, bottom: Constants.gridLayout.HSGridTopMargin.rawValue, right: Constants.gridLayout.HSGridSideMargin.rawValue)
        
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cardWidth = Constants.cardSizes.HSCardWidth.rawValue
        let cardHeight = Constants.cardSizes.HSCardHeight.rawValue
        let cardSize = CGSize(width: cardWidth, height: cardHeight)
        
        return cardSize
    }
    
    
    
}
