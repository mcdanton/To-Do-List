//
//  AllToDoListsViewController.swift
//  w4d1 - ToDoList - DanHefter
//
//  Created by Dan Hefter on 11/14/16.
//  Copyright © 2016 GA. All rights reserved.
//

import UIKit
import Firebase

class AllToDoListsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
   
   let selectedToDoListViewController = SelectedToDoListViewController()
   
   @IBOutlet weak var allToDoListTableView: UITableView!
   @IBOutlet weak var modalNewListView: UIView!
   @IBOutlet weak var modalNewViewTextField: UITextField!
   @IBOutlet weak var cancelButtonOutlet: UIBarButtonItem!
   
   
   func listenForLists() {
      
      let savedLists = FIRDatabase.database().reference(withPath: "lists")
      savedLists.queryOrderedByKey().observe(.value, with: didUpdateLists)
   }
   
   func didUpdateLists(snapshot:FIRDataSnapshot) {
      
      createdToDoLists.removeAll()
      for item in snapshot.children {
         let list = ToDoList(snapshot: item as! FIRDataSnapshot)
         createdToDoLists.append(list)
      }
      print(createdToDoLists)
   }
   
   
   func createList(title: String) {
      
      let listsRef = FIRDatabase.database().reference(withPath: "lists")
      let list = ToDoList(listTitle: title)
      let listRef = listsRef.child(title)
      listRef.setValue(list.toAnyObject())
      
   }
   
   
   @IBAction func cancelNewList(_ sender: AnyObject) {
      modalNewListView.isHidden = true
      cancelButtonOutlet.isEnabled = false
      modalNewViewTextField.text = nil
   }
   
   
   @IBAction func addNewListButton(_ sender: AnyObject) {
      modalNewListView.isHidden = false
      modalNewViewTextField.becomeFirstResponder()
      cancelButtonOutlet.isEnabled = true
   }
   
   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      modalNewViewTextField.endEditing(true)
      guard let modalText = modalNewViewTextField.text, modalText.characters.count > 0 else {
         modalNewListView.isHidden = true
         cancelButtonOutlet.isEnabled = false
         return true
      }
      createdToDoLists.append(ToDoList(listTitle: modalText))
      
      modalNewListView.isHidden = true
      allToDoListTableView.reloadData()
      modalNewViewTextField.text = nil
      return true
   }
   
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
         createdToDoLists.remove(at: indexPath.item)
      }
   }
   
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return createdToDoLists.count
   }
   
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "AllToDoListsTableViewCell", for: indexPath) as! AllToDoListsTableViewCell
      
      cell.newListLabel.text = createdToDoLists[indexPath.item].listTitle
      cancelButtonOutlet.isEnabled = false
      return cell
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
      let selectedToDoListViewController = segue.destination as! SelectedToDoListViewController
      selectedToDoListViewController.selectedIndexOfList = allToDoListTableView.indexPathForSelectedRow!.row
   }
   
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      listenForLists()
      
      modalNewViewTextField.delegate = self
      modalNewListView.isHidden = true
      cancelButtonOutlet.isEnabled = false
      
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
