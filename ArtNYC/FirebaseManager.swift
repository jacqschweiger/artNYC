//
//  FirebaseManager.swift
//  ArtNYC
//
//  Created by Jacqueline Schweiger on 9/17/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import FirebaseDatabase
import UIKit
import MapKit

class FirebaseManager {
    
    static let shared = FirebaseManager()
    private init() {}
    let ref = FIRDatabase.database().reference(withPath: "museums")
    
    func getFBSnapshot(with completion: @escaping ([[String: Any]])->()) {
        
        var museumDicts = [[String:Any]]()
        
        ref.observe(.value, with: { (snapshot) in
            
            for item in snapshot.children.allObjects as! [FIRDataSnapshot] {
                guard let dict = item.value as? [String: Any] else { return }
                museumDicts.append(dict)
            }
            completion(museumDicts)
        })
    }
    
}
