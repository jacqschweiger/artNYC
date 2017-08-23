//
//  MuseumTableView.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 8/22/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class MuseumTableView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var museums: [Museum] = []
    var museumTableView: UITableView!
    let header = UILabel()
    var selectedMuseum: Museum!
    var filterButton = UIButton()
    var categories: [String]!
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        museumTableView = UITableView(frame: self.frame)
        
        self.museumTableView.delegate = self
        self.museumTableView.dataSource = self
        
        museumTableView.register(CategoryRow.self, forCellReuseIdentifier: "cell")
        
        setUpElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpElements(){
        
        categories = ["Modern & Contemporary", "Old Masters", "Fashion/Design", "Non-Western", "Encyclopedic", "Not Paintings", "All Museums"]
        
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
        header.text = "ART MUSEUMS"
        header.font = UIFont(name: "Avenir", size: 18)
        header.textAlignment = .center
        header.textColor = UIColor.white
        
        
        self.addSubview(museumTableView)
        self.museumTableView.topAnchor.constraint(equalTo: self.header.bottomAnchor).isActive = true
        self.museumTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.museumTableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.museumTableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.museumTableView.translatesAutoresizingMaskIntoConstraints = false
        self.museumTableView.backgroundColor = UIColor(named: UIColor.ColorName.turquoise)
    }
    
}

//MARK:- TableView Delegate and DataSource
extension MuseumTableView {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.black
        
        let headerLabel = UILabel(frame: CGRect(x: 30, y: 0, width:
            tableView.bounds.size.width, height: tableView.bounds.size.height))
        headerLabel.font = UIFont(name: "Avenir", size: 16)
        headerLabel.textColor = UIColor.white
        headerLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CategoryRow
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }


}

