//
//  SelectedToDoListViewController.swift
//  w4d1 - ToDoList - DanHefter
//
//  Created by Dan Hefter on 11/14/16.
//  Copyright © 2016 GA. All rights reserved.
//

import UIKit
import Firebase

class SelectedToDoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
   
   
   @IBOutlet weak var selectedListTableView: UITableView!
   @IBOutlet weak var addNewItemTextField: UITextField!
   
   var selectedIndexOfList: Int?
   var currentList: ToDoList {
      return createdToDoLists[selectedIndexOfList!]
   }
   
   //MARK: Firebase Functions
   func createItem(title: String) {
      let item = Item(itemTitle: title)
      let itemRef = currentList.reference?.child(title)
      itemRef?.setValue([
         "itemDescription": "",
         "taskCompleted": false
         ])
   }
   
   func listenForTasks() {
      currentList.reference?.observe(.value, with: didUpdateTasks)
   }
   
   func didUpdateTasks(snapshot:FIRDataSnapshot) {
      
      let updatedList = ToDoList(snapshot:snapshot)
      createdToDoLists[selectedIndexOfList!] = updatedList
      }
   
   
   //MARK: TableView Setup
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return createdToDoLists[selectedIndexOfList!].itemsOnList.count
   }
   
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedToDoListTableViewCell", for: indexPath) as! SelectedToDoListTableViewCell
      let currentItem: Item = createdToDoLists[selectedIndexOfList!].itemsOnList[indexPath.row]
      
      cell.currentIndexOfItem = indexPath.row
      cell.selectedList = selectedIndexOfList
      
      if currentItem.taskCompleted == true {
         cell.displayToDoLabel.attributedText = currentItem.attributeString
         cell.taskCompleteButton.setBackgroundImage(UIImage(named: "checkedBox"), for: UIControlState.normal)
      } else {
         cell.displayToDoLabel.text = currentItem.itemTitle
         cell.taskCompleteButton.setBackgroundImage(UIImage(named: "emptyCheckbox"), for: UIControlState.normal)
      }
      return cell
   }
   
   
   
   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      addNewItemTextField.endEditing(true)
      
      guard let addNewItemText = addNewItemTextField.text else { return true }
      
      createdToDoLists[selectedIndexOfList!].itemsOnList.append(Item(itemTitle: addNewItemText))
      createItem(title: addNewItemText)
      
      selectedListTableView.reloadData()
      addNewItemTextField.text = nil
      return true
   }
   
   
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
         createdToDoLists[selectedIndexOfList!].itemsOnList.remove(at: indexPath.item)
      }
   }
   
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let detailViewController = segue.destination as! DetailViewController
      detailViewController.selectedItem = createdToDoLists[selectedIndexOfList!].itemsOnList[selectedListTableView.indexPathForSelectedRow!.row]
   }
   
   
   //MARK: View Did Load
   override func viewDidLoad() {
      addNewItemTextField.delegate = self
      addNewItemTextField.becomeFirstResponder()
      
      
      super.viewDidLoad()
      listenForTasks()
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
