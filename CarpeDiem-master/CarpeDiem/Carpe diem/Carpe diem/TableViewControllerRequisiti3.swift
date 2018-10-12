//
//  TableViewControllerRequisiti3.swift
//  Carpe diem
//
//  Created by massarovaleriogiuseppe on 11/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

class TableViewControllerRequisiti3: UITableViewController {

    
    var settore: String?
    var lavori: [job] = []
    var jobID = [1,1,1,2,2]
    var jobNome = ["Mobile", "Videogame", "Desktop", "Penal", "Civil"]
    var jobRequisiti = ["The developer deals with the development of mobile devices for the most widespread platforms: Google's Android and Apple's IOS.\nVersatile and able to develop the tools and techniques of development of different technologies: Objective-C and Xcode for Apple / iOS development; Java and Eclipse for Android development; C # and Visual Studio for Windows Phone development; RESTful architecture; Xamarin for the development of multiplatform App.\\nAccording to Kelly Services it is much simpler in terms of experience and degree in Computer Science / Engineering.", "", "", "High school diploma\nLaw Degree\nForensic practice, 18 month\nState Certification Exam (Bar Exam)\n\nIn order to become a lawyer, firstly you need to be graduated in Law.\nActually you can sign up to a degree course in Law. Its duration is 5 years.\nOnce graduated, you need to undertake forensic practice at a lawyer studio, lasting 18 month. If you are interested in criminal law, the advice is to choose a lawyer specialised in criminal law trials.\nIn the end you will take a State Certification Exam in order to definitely become a lawyer.", ""]
    var jobCaratteristiche = ["Within the software life cycle, the programmer's activity, also defined as development or coding activity, is conceptually next to the analysis activity and prior to the testing activity, usually performed by other professionals, respectively the analysts and the beta tester testers. In practice, the programmer realizes the actual program on the basis of the specification document (technical or functional) drawn up by the analyst, in which the behaviors and algorithms to be implemented in the program are described at the logical level. "," The position of the programmer analyst is configured as an evolution of the professional programmer. In fact, the programmer analyst embodies the skills of two distinct figures: that of the analyst and that of the programmer. The analyst deals with the analysis of customer needs and translate these into a working project through the coordination of a team of programmers. The programmer deals with the development of software in various languages ​​starting from an analyst's project.", "", "", "", ""]
    var lavoriFilter: [job] = []
    
    
    
    override func viewDidLoad() {
        for i in 0..<jobNome.count{
            lavori.append(job(id: jobID[i], name: jobNome[i], description: "", caratteristiche: jobCaratteristiche[i], requisiti: jobRequisiti[i]))
        }

        if (settore == "Development") {
            for i in 0..<lavori.count {
                if(lavori[i].id == 1){
                    lavoriFilter.append(lavori[i])
                }
            }
        } else {
            for i in 0..<lavori.count {
                if(lavori[i].id == 2){
                    print(lavori[i])

                    lavoriFilter.append(lavori[i])
                }
            }
        }
        
        super.viewDidLoad()

    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return lavoriFilter.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellRequisiti3", for: indexPath) as! TableViewCellRequisiti3

        cell.labelLavoro.text = lavoriFilter[indexPath.row].name

        return cell
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seguiRequisiti4" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as!
                ViewControllerRequisiti4
                
                destinationController.lavoro = lavoriFilter[indexPath.row]
            }
        }
    }
    
  

}
