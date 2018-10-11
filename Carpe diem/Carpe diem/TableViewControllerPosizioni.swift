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
}


class TableViewControllerPosizioni: UITableViewController, UISearchResultsUpdating, NSFetchedResultsControllerDelegate {

    var persone: [PersonaMO] = []
    var fetchResultController : NSFetchedResultsController<PersonaMO>!
    var searchController: UISearchController!
    var searchResults: [job] = []
    var jobs: [job] = []
    var jobsFilter: [job] = []
    var jobId: [Int] = [1, 1, 1, 2, 2]
    var jobName: [String] = ["Programer","Analist", "Security Developer", "Cuoco", "Cameriere"]
    var jobDescription: [String] = ["Figura professionale che si occupa della fase di codifica del sistema progettato.",      "L'analista si occupa dell'analisi delle esigenze del cliente e di tradurre queste ultime in un progetto funzionante.",     "È uno specialista in grado di individuare eventuali intrusioni o tentativi di spionaggio elettronico ai danni dell'impresa per la quale opera.",     "Un cuoco è una persona addetta alla preparazione e cottura dei cibi. Nell'ambito della ristorazione indica un esperto del settore alimentare che lavora nelle cucine di pubblici esercizi",    "Il cameriere è la persona addetta a servire i clienti presso un bar, un ristorante, un albergo"]
    var jobCaratteristiche: [String] = ["Nell'ambito del ciclo di vita del software, l'attività del programmatore, definita anche sviluppo o attività di codifica, concettualmente è successiva all'attività di analisi e precedente a quella di collaudo, solitamente eseguita da altri professionisti, rispettivamente gli analisti ed i collaudatori beta tester. In pratica il programmatore realizza il programma vero e proprio sulla base del documento di specifica (tecnica o funzionale) redatto dell'analista, in cui sono descritti a livello logico i comportamenti e gli algoritmi che devono essere realizzati nel programma stesso. ",        "La posizione dell’analista programmatore si configura come un’evoluzione della figura professionale di programmatore. In effetti, l’analista programmatore racchiude in sé le competenze di due figure distinte: quella dell'analista e quella del programmatore. L'analista si occupa dell'analisi delle esigenze del cliente e di tradurre queste ultime in un progetto funzionante attraverso il coordinamento di un team di programmatori. Il programmatore si occupa dello sviluppo del software nei vari linguaggi partendo dal progetto di un analista.",        "È uno specialista in grado di individuare eventuali intrusioni o tentativi di spionaggio elettronico ai danni dell'impresa per la quale opera. Contro tali forme d’aggressione, l'addetto alla sicurezza mette in campo la propria preparazione tecnico-scientifica al fine di garantire e proteggere i dati su Internet, intranet e reti. A questo proposito, va sottolineato che, nel campo della sicurezza, il concetto di sistema informativo non è inteso esclusivamente come sinonimo di computer, ma comprende tutto quanto ruota attorno e partecipa al trattamento, alla conservazione, all'accesso e alla diffusione di dati e informazioni proprie dell'azienda. Non va perciò escluso o tralasciato in questo contesto l'elemento umano.",        "Un cuoco è una persona addetta alla preparazione e cottura dei cibi. Nell'ambito della ristorazione indica un esperto del settore alimentare che lavora nelle cucine di pubblici esercizi (ristoranti, tavole calde e fredde), navi alberghi o altre aziende di banqueting, o ristorazione collettiva organizzata (mense di aziende, scuole e ospedali) organizzando gli ambienti e cucinando le pietanze da servire alla clientela. Si tratta di un mestiere dalla gavetta lunga, con turni di lavoro molto lunghi e orari spesso estenuanti."                 , "I compiti del cameriere comprendono: preparazione della sala e dei tavoli, ordinamento delle stanze, accoglienza della clientela, servizio a tavola, mise en place, presentazione del conto ecc. L'orario di lavoro del cameriere è solitamente organizzato in turni, che possono protrarsi fino a notte tarda se il pubblico esercizio effettua servizio diurno e serale. In determinate strutture i camerieri sono divisi secondo una gerarchia, la brigata di sala, così ripartita:\n\nMaître d'hotel (può esservene più di uno);\nMaître de salle;\nMaître de rang;\nChef de rang;\nCommis de rang;\nSommelier;"]
    
    
    override func viewDidLoad() {
        for i in 0..<jobName.count {
            jobs.append(job(id: jobId[i], name: jobName[i], description: jobDescription[i], caratteristiche: jobCaratteristiche[i]))
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
                    
                    if (persona.settore == "Ingegneria Informatica" || persona.settore == "Ramo Informatico"){
                        for i in 0..<jobs.count {
                            print(i)
                            if (jobs[i].id == 1) {
                                jobsFilter.append(jobs[i])
                            }
                        }
                    } else if(persona.settore == "Cucina"){
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
                destinationController.job =
                    jobsFilter[indexPath.row]
            }
        }
    }

}
