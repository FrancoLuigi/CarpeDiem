//
//  ViewControllerSector.swift
//  Carpe diem
//
//  Created by francoluigi on 09/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit


class ViewControllerSector: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    
    var settoriLaurea: [String] = ["Ingegneria Informatica", "Ingeneria Energetica", "Ingeneria Civile", "Ingeneria Gestionale", "Economia e Management", "Giurisprudenza", "Biologia", "Chimica", "Biotecnologie", "Scienze politiche", "Agraria",  "Medicina"]
    var settoriDiploma: [String] = ["Maturità scientifica", "Maturità classica", "Professionale idraulica", "Professionale meccanica", "Professionale alberghiero", "Ramo commerciale", "Ramo informatico"]
    var settoriAttestato: [String] = ["Cucina", "Informatico", "Lingua inglese", "Lingua francese"]
    
    
    var persona = PersonaMO()
    public var s : String = ""
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    @IBAction func buttonClick(_ sender: UIButton) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = appDelegate.persistentContainer.viewContext
         
            persona.settore = s
            appDelegate.saveContext()
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var titleData: String
        
        if(persona.titolo == "Laurea"){
            titleData = settoriLaurea[row]
        } else if(persona.titolo == "Diploma"){
            titleData = settoriDiploma[row]
        } else {
            titleData = settoriAttestato[row]
        }
        
        s = titleData
        
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        return myTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var titleData: String
        
        
        
        if(persona.titolo == "Laurea"){
            titleData = "Ingegneria Informatica"
            titleData = settoriLaurea[row]
        } else if(persona.titolo == "Diploma"){
            titleData = "Maturità scientifica"
            titleData = settoriDiploma[row]
        } else {
            titleData = "Cucina"
            titleData = settoriAttestato[row]
        }
        
        s = titleData
        print(s)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        pickerView.backgroundColor = UIColor(white: 1.0, alpha: 0.0)
            
        pickerView.delegate = self
        pickerView.dataSource = self
            // Do any additional setup after loading the view.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(persona.titolo == "Laurea"){
            return settoriLaurea.count
        }
        if(persona.titolo == "Diploma"){
            return settoriDiploma.count
        }

        return settoriAttestato.count
            
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            
            if(persona.titolo == "Laurea"){
                return settoriLaurea[row]
            }
            
            if(persona.titolo == "Diploma"){
                return settoriDiploma[row]
            }
            
            return settoriLaurea[row]
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "segueSkills"){
            let wc = segue.destination as! ViewControllerSkills
            wc.persona = persona
            
        }
    }

}
