//
//  AllToDoListsViewController.swift
//  w4d1 - ToDoList - DanHefter
//
//  Created by Dan Hefter on 11/14/16.
//  Copyright © 2016 GA. All rights reserved.
//

import UIKit

class AllToDoListsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
   
   let selectedToDoListViewController = SelectedToDoListViewController()
   
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
      createdToDoLists.append(ToDoList(listTitle: modalText))
      let encodeData = NSKeyedArchiver.archivedData(withRootObject: createdToDoLists)
      UserDefaults.standard.set(encodeData, forKey: "createdToDoLists")
      
      modalNewListView.isHidden = true
      allToDoListTableView.reloadData()
      modalNewViewTextField.text = nil
      return true
   }

   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
         createdToDoLists.remove(at: indexPath.item)
         allToDoListTableView.reloadData()
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
//      
//      guard let index = allToDoListTableView.indexPathForSelectedRow?.row, index < createdToDoLists.count else {
//         return
//      }
//      let list = createdToDoLists[index]
      
      
      let selectedToDoListViewController = segue.destination as! SelectedToDoListViewController
      selectedToDoListViewController.selectedIndexOfList = allToDoListTableView.indexPathForSelectedRow!.row
      UserDefaults.standard.set(selectedToDoListViewController.selectedIndexOfList, forKey: "createdToDoLists")
   }
   
    override func viewDidLoad() {
        super.viewDidLoad()

/* Uncomment here if you want to delete the saved data in UserDefaults!!
      UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
      UserDefaults.standard.synchronize()
*/
      modalNewViewTextField.delegate = self
      modalNewListView.isHidden = true
      cancelButtonOutlet.isEnabled = false
      if let encodeData = UserDefaults.standard.object(forKey: "createdToDoLists") as? Data {
         createdToDoLists = NSKeyedUnarchiver.unarchiveObject(with: encodeData) as! [ToDoList]
         SelectedToDoListViewController.selectedIndexOfList = NSKeyedUnarchiver.unarchiveObject(with: encodeData) as! Int

      }
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
