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
        
        store.loadMuseums()
        
    }
    
    override func viewWillAppear(_ animated: Bool = false) {
        self.title = "ART • NYC"
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.museums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath) 
        //let cell = MuseumsTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "basicCell")
        cell.textLabel?.text = store.museums[indexPath.row].name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let dest = segue.destination as? DetailVC,
                let indexPath = tableView.indexPathForSelectedRow {
                dest.museum = store.museums[indexPath.row]
            }
        }
        
        if segue.identifier == "showMap" {
            _ = segue.destination as? MapVC
        }
    }
    
    
}


