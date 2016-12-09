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
   @IBOutlet weak var taskCompleteButton: UIButton!
   
   var selectedList: Int?
   var currentIndexOfItem: Int?
   
   
   func strikethroughText() -> () {
      
      guard let myList = selectedList else {return}
      guard let myItemIndex = currentIndexOfItem else {return}
      createdToDoLists[myList].itemsOnList[myItemIndex].attributeString = NSMutableAttributedString(string: displayToDoLabel.text!)
      createdToDoLists[myList].itemsOnList[myItemIndex].attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 1, range: NSMakeRange(0, (displayToDoLabel.text?.characters.count)!))
      createdToDoLists[myList].itemsOnList[myItemIndex].attributeString.addAttribute(NSStrikethroughColorAttributeName, value: UIColor.black, range: NSMakeRange(0, (displayToDoLabel.text?.characters.count)!))
      
      displayToDoLabel.attributedText = createdToDoLists[myList].itemsOnList[myItemIndex].attributeString
   }
   
   
   @IBAction func taskCompletedAction(_ sender: AnyObject) {
      
      guard let myList = selectedList else {return}
      guard let myItemIndex = currentIndexOfItem else {return}
      
      if createdToDoLists[myList].itemsOnList[myItemIndex].taskCompleted == true  {
         
         taskCompleteButton.setBackgroundImage(UIImage(named: "emptyCheckbox" ), for: UIControlState.normal)
         displayToDoLabel.text! = createdToDoLists[myList].itemsOnList[myItemIndex].itemTitle
         createdToDoLists[myList].itemsOnList[myItemIndex].taskCompleted = false
         
      } else {
         
         taskCompleteButton.setBackgroundImage(UIImage(named: "checkedBox" ), for: UIControlState.normal)
         strikethroughText()
         createdToDoLists[myList].itemsOnList[myItemIndex].taskCompleted = true
      }
   }
   
   
   
   
   
   override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
   }
   
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
      
      // Configure the view for the selected state
   }
}
