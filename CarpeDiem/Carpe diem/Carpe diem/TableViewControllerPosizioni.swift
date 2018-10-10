//
//  TableViewControllerPosizioni.swift
//  Carpe diem
//
//  Created by massarovaleriogiuseppe on 08/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

struct job {
    var name: String?
    var description: String?
}

class TableViewControllerPosizioni: UITableViewController, UISearchResultsUpdating {

    var searchController: UISearchController!
    var searchResults: [job] = []
    var jobs: [job] = []
    var jobName: [String] = ["Sviluppatore", "Database", "Web Designer"]
    var jobDescription: [String] = ["Figura professionale incaricata di seguire l'intero ciclo di vita del software dalla progettazione alla codifica.", "Figura che si occupa della gestione di bache dati.", "Si occupa della progettazione di siti web."]
    
    override func viewDidLoad() {
        for i in 0..<jobName.count {
            jobs.append(job(name: jobName[i], description: jobDescription[i]))
            
        }
        super.viewDidLoad()
        
        searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        if (jobName.count>0) {
            tableView.separatorStyle = .singleLine
        } else {
            tableView.separatorStyle = .none
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return searchResults.count
        } else {
            return jobName.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCellPosizioni
        
        let job = (searchController.isActive) ? searchResults[indexPath.row] :
            jobs[indexPath.row]
        // Configure the cell...
        cell.job.text = job.name
        cell.descrizione.text = job.description
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        if searchController.isActive {
            return false
        } else {
            return true
        }
    }
    
  
    
    func filterContent(for searchText: String) {
        searchResults = jobs.filter({ (job) -> Bool in
            if let name = job.name {
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
