//
//  ViewControllerDate.swift
//  Carpe diem
//
//  Created by francoluigi on 09/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

class ViewControllerDate: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func buttonClick(_ sender: UIButton) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = appDelegate.persistentContainer.viewContext
            
            
            
            var persona = PersonaMO(context : context)
            
           
            
            persona.data = datePicker.date
            
            print(datePicker.date)
            appDelegate.saveContext()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

      /*  let dateFormatter = DateFormatter()
        var convertedDate: String!
        dateFormatter.dateFormat = "dd/MM/yyyy"
        convertedDate = dateFormatter.string(from: datePicker.date)
       */
        // Do any additional setup after loading the view.
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
