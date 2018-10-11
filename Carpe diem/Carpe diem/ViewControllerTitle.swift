//
//  ViewControllerTitle.swift
//  Carpe diem
//
//  Created by francoluigi on 09/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

class ViewControllerTitle: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    
    var persona = PersonaMO()
    var t : String = "Laurea"
    let  titles = ["Laurea","Diploma", "Attestato"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    @IBAction func buttonClick(_ sender: UIButton) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            
            persona.titolo = t
            print(persona)
            appDelegate.saveContext()
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = titles[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont(name: "Helvetica Neue", size: 21.0)])
        return myTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        t = titles[row]
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
        return titles.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        t = titles[row]
        return titles[row]
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if(segue.identifier == "segueSector"){
            let wc = segue.destination as! ViewControllerSector
            wc.persona = persona
            
        }
    }
    

}
