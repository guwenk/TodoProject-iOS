//
//  TableViewSection.swift
//  TodoProject
//
//  Created by Admin on 18.09.2018.
//  Copyright © 2018 guwenk. All rights reserved.
//

import UIKit

class TableViewSection: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
