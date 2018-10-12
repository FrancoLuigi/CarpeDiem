//
//  TableViewControllerRequisiti2.swift
//  Carpe diem
//
//  Created by massarovaleriogiuseppe on 11/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

class TableViewControllerRequisiti2: UITableViewController  {

    
    var requisito: String?
    var settoriIT: [String] = ["Development", "Database", "OS", "Telecomunication", "Web", "Security", "..."]
    var settoriTurismo : [String] = ["Catering", "Entertainment", "culture", "..."]
    var settoriLaw: [String] = ["Advocacy", "Magistracy", "Insurance", "..."]
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
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return settori.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellRequisiti2", for: indexPath) as! TableViewCellRequisiti2

        let settore = settori[indexPath.row]
        cell.labelSettori.text = settore

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seguiRequisiti3" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as!
                TableViewControllerRequisiti3
                let settore = settori[indexPath.row]
                
                destinationController.settore = settore
            }
        }
    }
}
