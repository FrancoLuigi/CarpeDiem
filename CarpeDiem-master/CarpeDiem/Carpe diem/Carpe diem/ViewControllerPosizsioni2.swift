//
//  ViewControllerPosizsioni2.swift
//  Carpe diem
//
//  Created by massarovaleriogiuseppe on 10/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

class ViewControllerPosizsioni2: UIViewController {
    
    var job: job?
    
    @IBOutlet weak var labelName: UILabel!    
    @IBOutlet weak var labelDescrizione: UILabel!
    
    override func viewDidLoad() {
        labelDescrizione.text = job?.caratteristiche
        labelName.text = job?.name
        super.viewDidLoad()
    }
    
}
