//
//  AllToDoListsViewController.swift
//  w4d1 - ToDoList - DanHefter
//
//  Created by Dan Hefter on 11/14/16.
//  Copyright © 2016 GA. All rights reserved.
//

import UIKit

class AllToDoListsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
   
   @IBOutlet weak var allToDoListTableView: UITableView!
   @IBOutlet weak var modalNewListView: UIView!
   @IBOutlet weak var modalNewViewTextField: UITextField!
   @IBOutlet weak var cancelButtonOutlet: UIBarButtonItem!

   
   
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
      CoreDataModel.model.createList(title: modalText)
      modalNewListView.isHidden = true
      allToDoListTableView.reloadData()
      modalNewViewTextField.text = nil
      return true
   }

   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
         CoreDataModel.model.deleteList(list: CoreDataModel.model.allLists[indexPath.item])
//         createdToDoLists.remove(at: indexPath.item)
         allToDoListTableView.reloadData()
      }
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return CoreDataModel.model.allLists.count
   }

   
   
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "AllToDoListsTableViewCell", for: indexPath) as! AllToDoListsTableViewCell
      cell.newListLabel.text = CoreDataModel.model.allLists[indexPath.item].listTitle
      cancelButtonOutlet.isEnabled = false
      return cell
   }

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//      
//      guard let index = allToDoListTableView.indexPathForSelectedRow?.row, index < createdToDoLists.count else {
//         return
//      }
//      let list = createdToDoLists[index]
      
      
      let selectedToDoListViewController = segue.destination as! SelectedToDoListViewController
      selectedToDoListViewController.selectedIndexOfList = allToDoListTableView.indexPathForSelectedRow!.row
   }
   
    override func viewDidLoad() {
        super.viewDidLoad()
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
