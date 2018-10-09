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
    var requisiti: [String?] = ["Art", "Turism", "IT", "Environment"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return restaurantNames.count
        if searchController.isActive {
            return searchResults.count
        } else {
            return requisiti.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellRequisiti", for: indexPath) as! TableViewCellRequisiti
        //layer.cornerRadius
        cell.textSettore.text = requisiti[indexPath.row]
        
        
        
        // Determine if we get the restaurant from search result or the original array
        let requisito = (searchController.isActive) ? searchResults[indexPath.row] :
            requisiti[indexPath.row]
        // Configure the cell...
        cell.textSettore.text = requisito
        
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        if searchController.isActive {
            return false
        } else {
            return true
        }
    }
    
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
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
