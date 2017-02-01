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
    var museumCollectionView: UICollectionView!
    let header = UILabel()
    var selectedMuseum: Museum!
    var filterButton = UIButton()
    weak var delegate: MuseumLisViewDelegate?
    
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
        self.addSubview(museumCollectionView)
        self.museumCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.museumCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.museumCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.museumCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.museumCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.museumCollectionView.backgroundColor = UIColor.white
        
        let filler = UILabel()
        self.addSubview(filler)
        filler.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        filler.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        filler.heightAnchor.constraint(equalToConstant: 6).isActive = true
        filler.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        filler.translatesAutoresizingMaskIntoConstraints = false
        
        //Header Set Up
        self.addSubview(header)
        self.header.topAnchor.constraint(equalTo: filler.bottomAnchor).isActive = true
        self.header.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
        self.header.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.header.translatesAutoresizingMaskIntoConstraints = false
        
        header.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
        header.text = "Art Museums NYC"
        header.font = UIFont(name: "Avenir Black", size: 26)
        header.textAlignment = .center
        header.textColor = UIColor.white
        
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
