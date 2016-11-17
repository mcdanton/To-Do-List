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
   
   var selectedList: ToDoList!
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return selectedList.itemsOnList.count
   }
   
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedToDoListTableViewCell", for: indexPath) as! SelectedToDoListTableViewCell
      cell.displayToDoLabel.text = selectedList.itemsOnList[indexPath.row].itemTitle
      return cell
   }
   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      addNewItemTextField.endEditing(true)
      
//      if addNewItemTextField.text = "" {  }
      guard let addNewItemText = addNewItemTextField.text else { return true }
            
      selectedList.itemsOnList.append(Item(itemTitle: addNewItemText))
      selectedListTableView.reloadData()
      addNewItemTextField.text = nil
      return true
   }


   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
         createdToDoLists.remove(at: indexPath.item)
         selectedListTableView.reloadData()
      }
   }
   
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let detailViewController = segue.destination as! DetailViewController
//      detailViewController.selectedList = selectedList
      detailViewController.selectedItem = selectedList.itemsOnList[selectedListTableView.indexPathForSelectedRow!.row]
   }
   
   
override func viewDidLoad() {
   addNewItemTextField.delegate = self
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
