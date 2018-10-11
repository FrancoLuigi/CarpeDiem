//
//  TableViewControllerRequisiti2.swift
//  Carpe diem
//
//  Created by massarovaleriogiuseppe on 11/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

class TableViewControllerRequisiti2: UITableViewController, UISearchResultsUpdating  {

    var searchController: UISearchController!
    var searchResults: [String?] = []
    var requisito: String?
    var settoriIT: [String] = ["Development", "Database", "OS", "Telecomunication", "Web", "Security"]
    var settoriTurismo : [String] = ["Ristorazione", "Intrattenimento", "Cultura"]
    var settoriLaw: [String] = ["Avvocatura", "Magistratura", "Addicurazioni"]
    var settori: [String?] = []
    
    override func viewDidLoad() {
        if(requisito == "IT"){
            settori = settoriIT
        } else if (requisito == "Turism"){
            settori = settoriTurismo
        } else {
            settori = settoriLaw
        }
    
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
            return settori.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellRequisiti2", for: indexPath) as! TableViewCellRequisiti2

        let settore = (searchController.isActive) ? searchResults[indexPath.row] :
            settori[indexPath.row]
        cell.labelSettore.text = settore

        return cell
    }
    

    func filterContent(for searchText: String) {
        searchResults = settori.filter({ (settore) -> Bool in
            if let name = settore {
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
