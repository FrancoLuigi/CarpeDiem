//
//  ViewControllerProfilo.swift
//  Carpe diem
//
//  Created by massarovaleriogiuseppe on 11/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit
import CoreData

class ViewControllerProfilo: UIViewController, NSFetchedResultsControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate  {
    
    
    
    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldSector: UITextField!
    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var textFieldSkill: UITextField!
    
   
    @IBOutlet weak var textFieldExperience: UITextField!
    
    var persone: [PersonaMO] = []
    var fetchResultController : NSFetchedResultsController<PersonaMO>!
    
    let  titles = ["Laurea Magistrale","Laurea Triennale","Diploma", "Attestato"]
    let  skills = ["Mobile", "Web", "Desktop", "Database"]
    let  sectors = ["Informatica", "Medico", "Giuridico", "Economico"]
    let experience = ["No experience", "1-3 years", "3-5 years", "7 o more years"]
    var nome : String?
    
    let picker = UIPickerView()
    let toolBar = UIToolbar()
    let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: "buttonAction")
    let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: "cancell")
    
    
    var t : String = ""
    
    
    @IBAction func buttonSave(_ sender: UIButton) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = appDelegate.persistentContainer.viewContext
            
            
            
            var persona = PersonaMO(context : context)
            
            persona.id = 1
            persona.nome = textFieldNome.text
            persona.competenza = textFieldSkill.text
            persona.esperienza = textFieldExperience.text
            persona.titolo = textFieldTitle.text
            persona.settore = textFieldSector.text
            
            
            appDelegate.saveContext()
            
        }
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        picker.showsSelectionIndicator = true
        picker.delegate = self
        picker.dataSource = self
        
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        textFieldTitle.inputView = picker
        textFieldTitle.inputAccessoryView = toolBar
        
        textFieldSector.inputView = picker
        textFieldSector.inputAccessoryView = toolBar
        
        textFieldSkill.inputView = picker
        textFieldSkill.inputAccessoryView = toolBar
        
        textFieldExperience.inputView = picker
        textFieldExperience.inputAccessoryView = toolBar
        
        
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
                    
                    textFieldNome.text=persona.nome
                    textFieldTitle.text=persona.titolo
                    textFieldSector.text=persona.settore
                    textFieldExperience.text=persona.esperienza
                    textFieldSkill.text=persona.competenza
                    print(persona)
                    /*
                     if(persone.count != 0) {
                     initialViewController = storyboard.instantiateViewController(withIdentifier: “ViewControllerSecondo")
                     }
                     */
                }
            } catch {
                print(error)
            }
        }
        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return titles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(textFieldTitle.isEditing){
            return titles[row]
        }
        else if(textFieldSector.isEditing){
            return sectors[row]
        }
        else if(textFieldSkill.isEditing){
            return skills[row]
        }
        else if(textFieldExperience.isEditing){
            return experience[row]
        }
        else{
            return " "
        }
        
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        t = titles[row]
    }
    
    
    
    func buttonAction (sender:UIBarButtonItem!) {
        print("ciccio")
        picker.isHidden=true
        textFieldTitle.text = t
        
        
    }
    
}
