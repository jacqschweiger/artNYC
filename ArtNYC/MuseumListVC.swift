//
//  MuseumListVC.swift
//  ArtNYC
//
//  Created by Jacqueline Minneman on 1/14/17.
//  Copyright © 2017 Jacqueline Schweiger. All rights reserved.
//

import Foundation
import UIKit

class MuseumListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var museumTableView: UITableView!
    
    var store = MuseumDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.loadMuseums()
        self.reloadInputViews()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.museums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        cell.textLabel?.text = store.museums[indexPath.row].title
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let dest = segue.destination as? DetailVC,
                let indexPath = museumTableView.indexPathForSelectedRow {
                dest.museum = store.museums[indexPath.row]
            }
        }
        
        if segue.identifier == "showMap" {
            _ = segue.destination as? MapVC
        }
    }

    
}
