//
//  MuseumsTableViewCell.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/13/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class MuseumsTableViewCell: UITableViewCell {
    
    var imageViewInst:UIImageView = UIImageView()
    var textLabelInst:UILabel = UILabel()
    
    required init(coder aDecoder: NSCoder) { fatalError("init(coder:)") }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
}
