//
//  ViewControllerDate.swift
//  Carpe diem
//
//  Created by francoluigi on 09/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

class ViewControllerDate: UIViewController {
    
    var stringa : String?
    var persona: PersonaMO = PersonaMO()
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func buttonClick(_ sender: UIButton) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = appDelegate.persistentContainer.viewContext
            
            
            
            persona = PersonaMO(context : context)
            
            persona.id = 1
            persona.nome = stringa
            persona.data = datePicker.date
            
            print(persona)
            appDelegate.saveContext()
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.setValue(false, forKeyPath: "highlightsToday")
      /*  let dateFormatter = DateFormatter()
        var convertedDate: String!
        dateFormatter.dateFormat = "dd/MM/yyyy"
        convertedDate = dateFormatter.string(from: datePicker.date)
       */
        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "segueTitle"){
            let wc = segue.destination as! ViewControllerTitle
            wc.persona = persona
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

}
