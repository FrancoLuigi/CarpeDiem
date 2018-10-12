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
    var skillIngegneriaInformatica: [String] = ["Development", "Design", "DataBase", "OS", "Automation", "Robotics", "Networks", "Telecommunications", "Web"]
    var skillManagement: [String] = ["Accounting", "Management", "Statistics", "Finance"]
    var skillGiurisprudenza: [String] = ["Advocacy", "Notary", "Mediation", "Corporate Audit"]
    var skillCucina = ["Chef", "Vice chef", "Assistant chef", "Dishwasher"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBAction func buttonClick(_ sender: UIButton) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            
            if(t == ""){
                if(persona.settore == "Computer engineering"){
                    t = "Development"
                } else if(persona.settore == "Law"){
                    t = "Advocacy"
                } else if (persona.settore == "Cook"){
                    t = "Chef"
                }else {
                    t = "Management"
                }
            }
            
            persona.competenza = t
            appDelegate.saveContext()
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var titleData: String
        
        if(persona.settore == "Computer engineering"){
            titleData = skillIngegneriaInformatica[row]
        } else if(persona.settore == "Law"){
            titleData = skillGiurisprudenza[row]
        } else if (persona.settore == "Cook"){
            titleData = skillCucina[row]
        } else {
            titleData = skillManagement[row]
        }
        
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        return myTitle
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var titleData: String
        
        if(persona.settore == "Computer engineering"){
            titleData = skillIngegneriaInformatica[row]
        } else if(persona.settore == "Law"){
            titleData = skillGiurisprudenza[row]
        } else if (persona.settore == "Cook"){
            titleData = skillCucina[row]
        } else {
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
        if(persona.settore == "Computer engineering"){
            return skillIngegneriaInformatica.count
        } else if(persona.settore == "Law"){
            return skillGiurisprudenza.count
        } else if (persona.settore == "Cook"){
            return skillCucina.count
        }
        
        return skillIngegneriaInformatica.count
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if(persona.settore == "Computer engineering"){
            return skillIngegneriaInformatica[row]
        } else if(persona.settore == "Law"){
            return skillGiurisprudenza[row]
        } else if (persona.settore == "Cook"){
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

