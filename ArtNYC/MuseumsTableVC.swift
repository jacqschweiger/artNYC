//
//  MuseumsTableVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/13/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import UIKit

class MuseumsTableVC: UITableViewController {
    
    var store = MuseumDataStore.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.createMuseums()
        
    }
    
    override func viewWillAppear(_ animated: Bool = false) {
        self.title = "ART • NYC"
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.museums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MuseumsTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "basicCell")
        cell.textLabel?.text = store.museums[indexPath.row].name
        return cell
    }
    
    

    


}

