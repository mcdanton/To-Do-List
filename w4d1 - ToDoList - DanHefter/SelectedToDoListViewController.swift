//
//  SelectedToDoListViewController.swift
//  w4d1 - ToDoList - DanHefter
//
//  Created by Dan Hefter on 11/14/16.
//  Copyright © 2016 GA. All rights reserved.
//

import UIKit

class SelectedToDoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
   
   
   @IBOutlet weak var selectedListTableView: UITableView!
   @IBOutlet weak var addNewItemTextField: UITextField!
   
   var selectedIndexOfList: Int?
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return (CoreDataModel.model.allLists[selectedIndexOfList!].arrayOfItemsOnList.count)
//      return createdToDoLists[selectedIndexOfList!].itemsOnList.count
   }
   
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedToDoListTableViewCell", for: indexPath) as! SelectedToDoListTableViewCell
      let currentItem = CoreDataModel.model.allLists[selectedIndexOfList!].arrayOfItemsOnList[indexPath.row]
//      let currentItem: Item = createdToDoLists[selectedIndexOfList!].itemsOnList[indexPath.row]
      cell.currentIndexOfItem = indexPath.row
      cell.selectedList = selectedIndexOfList
//      if currentItem.taskCompleted == true {
//         cell.displayToDoLabel.attributedText = currentItem.attributeString
//      } else {
//      cell.displayToDoLabel.text = currentItem.itemTitle
//      }
      return cell
   }
   
   
   
   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      addNewItemTextField.endEditing(true)
      
//      if addNewItemTextField.text = "" {  }
      guard let addNewItemText = addNewItemTextField.text else { return true }
      
      CoreDataModel.model.createItem(title: addNewItemText)
//      createdToDoLists[selectedIndexOfList!].itemsOnList.append(Item(itemTitle: addNewItemText))
      selectedListTableView.reloadData()
      addNewItemTextField.text = nil
      return true
   }


   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
         CoreDataModel.model.deleteItem(item: CoreDataModel.model.allLists[selectedIndexOfList!].arrayOfItemsOnList[indexPath.item])
//         createdToDoLists[selectedIndexOfList!].itemsOnList.remove(at: indexPath.item)
         selectedListTableView.reloadData()
      }
   }
   
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let detailViewController = segue.destination as! DetailViewController
      detailViewController.selectedItem = CoreDataModel.model.allLists[selectedIndexOfList!].arrayOfItemsOnList[selectedListTableView.indexPathForSelectedRow!.row]
//      detailViewController.selectedItem = createdToDoLists[selectedIndexOfList!].itemsOnList[selectedListTableView.indexPathForSelectedRow!.row]
   }
   
   
override func viewDidLoad() {
   addNewItemTextField.delegate = self
   addNewItemTextField.becomeFirstResponder()
   super.viewDidLoad()
   
   // Do any additional setup after loading the view.
}

override func didReceiveMemoryWarning() {
   super.didReceiveMemoryWarning()
   // Dispose of any resources that can be recreated.
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

}
