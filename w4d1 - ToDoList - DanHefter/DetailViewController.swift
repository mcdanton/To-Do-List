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
   
   var selectedList: ToDoList!

      func textViewDidBeginEditing(_ textView: UITextView) {
         detailViewTextField.text = ""
      }



    override func viewDidLoad() {
        super.viewDidLoad()
      detailViewTextField.delegate = self
      detailViewLabel.text = savedItemTitle

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

