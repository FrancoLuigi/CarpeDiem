//
//  ViewControllerRequisiti3.swift
//  Carpe diem
//
//  Created by massarovaleriogiuseppe on 11/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

class ViewControllerRequisiti4: UIViewController {

    var lavoro: job?
    
    @IBOutlet weak var labelRequisiti: UILabel!
    @IBOutlet weak var labelNome: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        labelNome.text = lavoro?.name
        labelRequisiti.text = lavoro?.requisiti
    }
}
