//
//  TableViewCellPosizioni.swift
//  Carpe diem
//
//  Created by massarovaleriogiuseppe on 08/10/18.
//  Copyright © 2018 massarovaleriogiuseppe. All rights reserved.
//

import UIKit

class TableViewCellPosizioni: UITableViewCell {

    @IBOutlet weak var descrizione: UILabel!
    @IBOutlet weak var job: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
