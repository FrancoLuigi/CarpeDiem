//
//  ViewController.swift
//  Carpe diem
//
//  Created by massarovaleriogiuseppe on 08/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

class ViewControllerName: UIViewController {

    var person = Persona.init(" ", Date.init())
    
    @IBOutlet weak var textFieldName: UITextField!
    
    
    @IBAction func buttonClick(_ sender: UIButton) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = appDelegate.persistentContainer.viewContext
            
            
            
            var persona = PersonaMO(context : context)
            
            
            persona.nome = textFieldName.text!
            print(persona.nome)
            person.nome=textFieldName.text!
            appDelegate.saveContext()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

class Persona {
    var nome: String
    var data: Date
    
    init(_ nome: String, _ data: Date){
        self.nome=nome
        self.data=data
    }
}

