//
//  ViewControllerSkills.swift
//  Carpe diem
//
//  Created by francoluigi on 09/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

class ViewControllerSkills: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var t : String = ""
    let  skills = ["Mobile","Web","Desktop", "Database"]
    let  skills1 = ["Giudice","Avvocato","Notaio"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBAction func buttonClick(_ sender: UIButton) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = appDelegate.persistentContainer.viewContext
            
            
            
            var competenza = CompetenzaMO(context : context)
            
            competenza.nome = t
            print(competenza.nome)
            
            appDelegate.saveContext()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return skills.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        t = skills[row]
        return skills[row]
    }
    

    
    
    
    
    
    
}

