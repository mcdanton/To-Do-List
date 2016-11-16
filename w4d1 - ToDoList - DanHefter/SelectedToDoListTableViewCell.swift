//
//  SelectedToDoListTableViewCell.swift
//  w4d1 - ToDoList - DanHefter
//
//  Created by Dan Hefter on 11/14/16.
//  Copyright © 2016 GA. All rights reserved.
//

import UIKit

class SelectedToDoListTableViewCell: UITableViewCell {
   
   @IBOutlet weak var displayToDoLabel: UILabel!
   
   
   
   
   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
