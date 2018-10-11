//
//  ViewController.swift
//  Carpe diem
//
//  Created by massarovaleriogiuseppe on 08/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

class ViewControllerName: UIViewController {
    
    //var person = Persona.init(" ", Date.init())
    var nome : String?
    @IBOutlet weak var textFieldName: UITextField!
    
    
    @IBAction func buttonClick(_ sender: UIButton) {
        
        
        nome=textFieldName.text!
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
         let context = appDelegate.persistentContainer.viewContext
        
         var persona = PersonaMO(context : context)
         
         persona.nome = textFieldName.text!
         print(persona.nome)
         persona.nome=textFieldName.text!
         appDelegate.saveContext()
         
         }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "segueDate"){
            let wc = segue.destination as! ViewControllerDate
            wc.stringa = nome
        }
    }
    
}



