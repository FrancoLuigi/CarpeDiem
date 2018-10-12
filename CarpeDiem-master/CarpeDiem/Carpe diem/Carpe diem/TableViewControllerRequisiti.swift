//
//  TableViewControllerRequisiti.swift
//  Carpe diem
//
//  Created by massarovaleriogiuseppe on 09/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var searchController: UISearchController!
    var searchResults: [String?] = []
    var requisiti: [String?] = ["Art", "Turism", "IT", "Environment", "Business", "Management", "Security", "Comunication", "Logistic", "Law", "..."] 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return requisiti.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellRequisiti", for: indexPath) as! TableViewCellRequisiti
    
        cell.textSettore.text = requisiti[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
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
}
