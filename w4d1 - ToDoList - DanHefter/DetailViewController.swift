//
//  DetailViewController.swift
//  w4d1 - ToDoList - DanHefter
//
//  Created by Dan Hefter on 11/16/16.
//  Copyright © 2016 GA. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextViewDelegate {
   
   @IBOutlet weak var detailViewLabel: UILabel!
   @IBOutlet weak var detailViewTextField: UITextView!
   
   var selectedItem: Item!
   
   func textViewDidBeginEditing(_ textView: UITextView) {
      detailViewTextField.text = ""
   }
   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      detailViewTextField.endEditing(true)
      selectedItem.itemDescription = detailViewTextField.text
      return true
   }
   
   
   override func viewDidLoad() {
      detailViewTextField.delegate = self
      detailViewLabel.text = selectedItem.itemTitle
      detailViewTextField.text = selectedItem.itemDescription
      super.viewDidLoad()
      
      // Do any additional setup after loading the view.
   }
   
   override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      if detailViewTextField.text == "" {
         detailViewTextField.text = selectedItem.itemDescription
      } else {
         selectedItem.itemDescription = detailViewTextField.text
         let encodeItem = NSKeyedArchiver.archivedData(withRootObject: createdToDoLists)
         UserDefaults.standard.set(encodeItem, forKey: "createdToDoLists")
      }
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

