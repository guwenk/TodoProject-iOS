//
//  TableViewCell.swift
//  TodoProject
//
//  Created by Admin on 17.09.2018.
//  Copyright © 2018 guwenk. All rights reserved.
//

import UIKit
import M13Checkbox

class TableViewCell: UITableViewCell {

    @IBOutlet weak var checkbox: M13Checkbox!
    @IBOutlet weak var labelText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        checkbox.stateChangeAnimation = .fill
        //checkbox.boxType = .square
        checkbox.markType = .checkmark
        checkbox.isUserInteractionEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
