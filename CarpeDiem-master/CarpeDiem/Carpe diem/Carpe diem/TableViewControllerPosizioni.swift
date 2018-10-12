//
//  TableViewControllerPosizioni.swift
//  Carpe diem
//
//  Created by massarovaleriogiuseppe on 08/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit
import CoreData


public struct job {
    var id: Int
    var name: String?
    var description: String?
    var caratteristiche: String?
    var requisiti: String?
}


class TableViewControllerPosizioni: UITableViewController, UISearchResultsUpdating, NSFetchedResultsControllerDelegate {
    
    var str: String?
    var num = 0
    var persone: [PersonaMO] = []
    var fetchResultController : NSFetchedResultsController<PersonaMO>!
    var searchController: UISearchController!
    var searchResults: [job] = []
    var jobs: [job] = []
    var jobsFilter: [job] = []
    var jobId: [Int] = [1, 1, 1, 2, 2, 3]
    var jobName: [String] = ["Programer","Analist", "Security Developer", "Cook", "Waiter", "Lawer"]
    var jobDescription: [String] = ["Professional figure that deals with the coding phase of the system designed. "," The analyst deals with the analysis of customer needs and translate these into a working project. ","Is a specialist able to identify any intrusion or attempted electronic espionage to the detriment of the company for which it operates. ","A cook is a person involved in preparing and cooking food. In the catering sector, he indicates a food industry expert who works in public catering kitchens ","The waiter is the person who serves customers in a bar, a restaurant, a hotel", ""]
    
    var jobRequisiti = ["The programer deals with the development of mobile devices for the most widespread platforms: Google's Android and Apple's IOS.\nVersatile and able to develop the tools and techniques of development of different technologies: Objective-C and Xcode for Apple / iOS development; Java and Eclipse for Android development; C # and Visual Studio for Windows Phone development; RESTful architecture; Xamarin for the development of multiplatform App.\\nAccording to Kelly Services it is much simpler in terms of experience and degree in Computer Science / Engineering.", "", "", "", "", "High school diploma\nLaw Degree\nForensic practice, 18 month\nState Certification Exam (Bar Exam)\n\nIn order to become a lawyer, firstly you need to be graduated in Law.\nActually you can sign up to a degree course in Law. Its duration is 5 years.\nOnce graduated, you need to undertake forensic practice at a lawyer studio, lasting 18 month. If you are interested in criminal law, the advice is to choose a lawyer specialised in criminal law trials.\nIn the end you will take a State Certification Exam in order to definitely become a lawyer."]
    var jobCaratteristiche: [String] = ["Within the software life cycle, the programmer's activity, also defined as development or coding activity, is conceptually next to the analysis activity and prior to the testing activity, usually performed by other professionals, respectively the analysts and the beta tester testers. In practice, the programmer realizes the actual program on the basis of the specification document (technical or functional) drawn up by the analyst, in which the behaviors and algorithms to be implemented in the program are described at the logical level. "," The position of the programmer analyst is configured as an evolution of the professional programmer. In fact, the programmer analyst embodies the skills of two distinct figures: that of the analyst and that of the programmer. The analyst deals with the analysis of customer needs and translate these into a working project through the coordination of a team of programmers. The programmer deals with the development of software in various languages ​​starting from an analyst's project. "," It is a specialist able to identify any intrusion or attempted electronic espionage to the detriment of the company for which it operates. Against such forms of aggression, the security officer puts in place his technical and scientific preparation in order to guarantee and protect data on the Internet, intranets and networks. In this regard, it should be emphasized that, in the field of security, the concept of an information system is not intended exclusively as a synonym for computers, but includes everything that revolves around and participates in the processing, storage, access and dissemination of data and company's own information. The human element should therefore not be excluded or omitted in this context. "," A cook is a person involved in preparing and cooking food. In the catering sector it indicates an expert in the food sector who works in the kitchens of public establishments (restaurants, hot and cold tables), hotel ships or other banqueting companies, or organized collective catering (canteens of companies, schools and hospitals) organizing the environments and cooking dishes to serve customers. It is a profession with a long apprenticeship, with very long work shifts and often exhausting hours. "," The duties of the waiter include: preparation of the room and tables, ordering of the rooms, reception of customers, table service, mise en place, presentation of the account etc. The waiter's working time is usually organized in shifts, which can last until late at night if the public service operates day and night. In certain structures the waiters are divided according to a hierarchy, the room brigade, as follows: \n \nMaître d'hotel (there may be more than one); \nMaître de salle; \nMaître de rang; \nChef de rang; \nCommis de rang; \nSommelier", ""]
    
    
   
    
    override func viewDidLoad() {
        num = num+1
        
        for i in 0..<jobName.count {
            jobs.append(job(id: jobId[i], name: jobName[i], description: jobDescription[i], caratteristiche: jobCaratteristiche[i], requisiti: jobRequisiti[i]))
        }
        
        
        
        
        let fetchRequest: NSFetchRequest<PersonaMO> = PersonaMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "nome", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            
            do {
                try fetchResultController.performFetch()
                if let fetchedObjects = fetchResultController.fetchedObjects {
                    persone = fetchedObjects
                    var persona = persone [persone.count-1]

                    print(persona)
                    
                    if (persona.settore == "Computer engineering" || persona.settore == "Ramo Informatico"){
                        for i in 0..<jobs.count {
                            print(i)
                            if (jobs[i].id == 1) {
                                jobsFilter.append(jobs[i])
                            }
                        }
                    } else if(persona.settore == "Cook"){
                        for i in 0..<jobs.count {
                            if (jobs[i].id == 2) {
                                jobsFilter.append(jobs[i])
                            }
                        }
                    }
                    
                }
            } catch {
                print(error)
            }
        }
    
        super.viewDidLoad()
        
        searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        if (jobsFilter.count>0) {
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
            return jobsFilter.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCellPosizioni
        
        let job = (searchController.isActive) ? searchResults[indexPath.row] :
            jobsFilter[indexPath.row]
        // Configure the cell...
        cell.textNome.text = job.name
        cell.textDescrizione.text = job.description
        
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
        searchResults = jobsFilter.filter({ (job) -> Bool in
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueJobPlacement" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as!
                ViewControllerPosizsioni2
              let job = (searchController.isActive) ? searchResults[indexPath.row] :
                   jobsFilter[indexPath.row]
                
                destinationController.job = jobsFilter[indexPath.row]

            }
        }
    }

}
