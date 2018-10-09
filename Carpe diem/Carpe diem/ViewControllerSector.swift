//
//  ViewControllerSector.swift
//  Carpe diem
//
//  Created by francoluigi on 09/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

class ViewControllerSector: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    public var s : String = ""
    let  sectors = ["Informatica","Medico","Giuridico", "Economico"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBAction func buttonClick(_ sender: UIButton) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = appDelegate.persistentContainer.viewContext
            
            
            
            var titolo = TitoloMO(context : context)
            
            
            titolo.settore = s
            print(titolo.settore)
            
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
            return sectors.count
        }
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            
            s = sectors[row]
            return sectors[row]
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
