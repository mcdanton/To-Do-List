//
//  TestFileViewController.swift
//  w4d1 - ToDoList - DanHefter
//
//  Created by Dan Hefter on 11/18/16.
//  Copyright © 2016 GA. All rights reserved.
//

import UIKit

class TestFileViewController: UIViewController {
   

   @IBOutlet weak var myLabel: UILabel!
   @IBAction func myFontButton(_ sender: AnyObject) {
   }
   


   


   

    override func viewDidLoad() {
        super.viewDidLoad()
      
      //let testString2 = NSMutableAttributedString(string: myLabel.text!, attributes: NSStrikethroughStyleAttributeName, value: 1, Range: NSMakeRange(0, myLabel.text?.characters.count))
      
      let testAttributeString = NSMutableAttributedString(string: myLabel.text!)
      testAttributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, (myLabel.text?.characters.count)!))
      testAttributeString.addAttribute(NSStrikethroughColorAttributeName, value: UIColor.black, range: NSMakeRange(0, (myLabel.text?.characters.count)!))
      
      
      myLabel.attributedText = testAttributeString
      
      
      
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
