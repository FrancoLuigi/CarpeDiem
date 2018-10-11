//
//  TableViewControllerRequisiti.swift
//  Carpe diem
//
//  Created by massarovaleriogiuseppe on 09/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchResultsUpdating {
    
    var searchController: UISearchController!
    var searchResults: [String?] = []
    var requisiti: [String?] = ["Art", "Turism", "IT", "Environment", "Business", "Management", "Security", "Comunication", "Logistic", "Law"] 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false

    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return searchResults.count
        } else {
            return requisiti.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellRequisiti", for: indexPath) as! TableViewCellRequisiti
    
        cell.textSettore.text = requisiti[indexPath.row]
        let requisito = (searchController.isActive) ? searchResults[indexPath.row] :
            requisiti[indexPath.row]
        
        cell.textSettore.text = requisito
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if searchController.isActive {
            return false
        } else {
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSettori" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as!
                TableViewControllerRequisiti2
                destinationController.requisito =
                    requisiti[indexPath.row]
            }
        }
    }
    
    
    func filterContent(for searchText: String) {
        searchResults = requisiti.filter({ (requisito) -> Bool in
            if let name = requisito {
                let isMatch = name.localizedCaseInsensitiveContains(searchText)
                return isMatch
            }
            return false
        })
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            tableView.reloadData()
        }
    }
}
