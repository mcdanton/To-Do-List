//
//  AllToDoListsTableViewCell.swift
//  w4d1 - ToDoList - DanHefter
//
//  Created by Dan Hefter on 11/14/16.
//  Copyright © 2016 GA. All rights reserved.
//

import UIKit

class AllToDoListsTableViewCell: UITableViewCell, UITextFieldDelegate {
   
   
   @IBOutlet weak var newListTextField: UITextField!
   @IBOutlet weak var newListLabel: UILabel!
   
   
   
   @IBAction func editListName(_ sender: AnyObject) {
      
      
   }
   

   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      newListTextField.endEditing(true)
      replaceTextFieldWithLabel()
      return true
   }
   
   
   func replaceTextFieldWithLabel() {
      newListTextField.isHidden = true
      newListLabel.isHidden = false
      newListLabel.text = newListTextField.text
   }

   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      newListTextField.delegate = self
      newListTextField.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

