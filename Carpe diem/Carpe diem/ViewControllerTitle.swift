//
//  ViewControllerTitle.swift
//  Carpe diem
//
//  Created by francoluigi on 09/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

class ViewControllerTitle: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    
    
    var t : String = ""
    let  titles = ["Laurea Magistrale","Laurea Triennale","Diploma", "Attestato"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    @IBAction func buttonClick(_ sender: UIButton) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            let context = appDelegate.persistentContainer.viewContext
            
            
            
            var titolo = TitoloMO(context : context)
            
            
            titolo.nome = t
            print(titolo.nome)
            
            appDelegate.saveContext()
        }
        
        
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = titles[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont(name: "Helvetica Neue", size: 21.0)])
        return myTitle
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //pickerView.setValue(UIColor.white, forKeyPath: "textColor")
        pickerView.backgroundColor = UIColor(white: 1.0, alpha: 0.0)
        //pickerView.setValue(false, forKeyPath: "highlightsFirst")
        
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return titles.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        t = titles[row]
        return titles[row]
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
