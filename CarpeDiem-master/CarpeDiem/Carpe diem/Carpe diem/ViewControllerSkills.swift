//
//  ViewControllerSkills.swift
//  Carpe diem
//
//  Created by francoluigi on 09/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

class ViewControllerSkills: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var persona = PersonaMO()
    var t : String = ""
    var skillIngegneriaInformatica: [String] = ["Sviluppo", "Design", "DataBase", "OS", "Automazione", "Robotica", "Reti", "Telecomunicazioni", "Web"]
    var skillManagement: [String] = ["Contabilità", "Management", "Statistica", "Finanza"]
    var skillGiurisprudenza: [String] = ["Avvocatura", "Notariato", "Mediazione", "Revisione societaria"]
    var skillCucina = ["Chef", "Vice chef", "Aiutante chef", "Lavapiatti"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBAction func buttonClick(_ sender: UIButton) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            
            persona.competenza = t
            appDelegate.saveContext()
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var titleData: String
        
        if(persona.settore == "Ingegneria Informatica"){
            titleData = skillIngegneriaInformatica[row]
        } else if(persona.settore == "Giurisprudenza"){
            titleData = skillGiurisprudenza[row]
        } else if (persona.settore == "Cucina"){
            titleData = skillCucina[row]
        } else {
            titleData = skillManagement[row]
        }
        
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        return myTitle
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var titleData: String
        
        if(persona.settore == "Ingegneria Informatica"){
            titleData = "Sviluppo"
            titleData = skillIngegneriaInformatica[row]
        } else if(persona.settore == "Giurisprudenza"){
            titleData = "Avvocatura"
            titleData = skillGiurisprudenza[row]
        } else if (persona.settore == "Cucina"){
            titleData = "Chef"
            titleData = skillCucina[row]
        } else {
            titleData = "Contabilità"
            titleData = skillManagement[row]
        }
        
        t = titleData
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        pickerView.backgroundColor = UIColor(white: 1.0, alpha: 0.0)
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(persona.settore == "Ingegneria Informatica"){
            return skillIngegneriaInformatica.count
        } else if(persona.settore == "Giurisprudenza"){
            return skillGiurisprudenza.count
        } else if (persona.settore == "Cucina"){
            return skillCucina.count
        }
        
        return skillIngegneriaInformatica.count
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if(persona.settore == "Ingegneria Informatica"){
            return skillIngegneriaInformatica[row]
        } else if(persona.settore == "Giurisprudenza"){
            return skillGiurisprudenza[row]
        } else if (persona.settore == "Cucina"){
            return skillCucina[row]
        }
        
        return skillIngegneriaInformatica[row]
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "segueExperience"){
            let wc = segue.destination as! ViewControllerExperience
            wc.persona = persona
            
        }
    }
}

