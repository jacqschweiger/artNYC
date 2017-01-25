//
//  FilterView.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/24/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class FilterView: UIView {
    
    var filterMenu = UIView()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        self.addSubview(filterMenu)
        
        self.filterMenu.backgroundColor = UIColor.blue
        self.filterMenu.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.filterMenu.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.filterMenu.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.filterMenu.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.filterMenu.translatesAutoresizingMaskIntoConstraints = false
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
