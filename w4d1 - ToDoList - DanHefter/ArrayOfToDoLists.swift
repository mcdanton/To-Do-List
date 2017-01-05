//
//  ArrayOfToDoLists.swift
//  w4d1 - ToDoList - DanHefter
//
//  Created by Dan Hefter on 11/14/16.
//  Copyright © 2016 GA. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ToDoList: NSObject {
   var listTitle: String
   var itemsOnList = [Item]()
   var reference: FIRDatabaseReference?
   
   init(listTitle: String) {
      self.listTitle = listTitle
   }
   
   // MARK: Firebase Reference
   init(snapshot:FIRDataSnapshot) {
      listTitle = snapshot.key
      //      let snapshotValue = snapshot.value as! [String:Any]
      reference = snapshot.ref
   }
   
   //parse list snapshot into List instance
   //Then get List from lists and add on Item instance
   //Then read all tasks per list
   func toAnyObject() -> Any {
      
      if itemsOnList.isEmpty {
         return 0
      } else {
         return 0
      }
      //      else {
      //         for task in itemsOnList {
      //            value[task.itemTitle] = task.toAnyObject()
      //         }
   }
}

class Item: NSObject {
   
   var itemTitle: String
   var itemDescription: String = "Add an item description"
   var taskCompleted: Bool = false
   var attributeString = NSMutableAttributedString()
   var reference: FIRDatabaseReference?
   
   init(itemTitle: String) {
      self.itemTitle = itemTitle
   }
   
   // MARK: Firebase Reference
   init(snapshot:FIRDataSnapshot) {
      itemTitle = snapshot.key
      let snapshotValue = snapshot.value as! [String:Any]
      itemTitle = snapshotValue["itemTitle"] as! String
      itemDescription = snapshotValue["itemDescription"] as! String
      taskCompleted = snapshotValue["taskCompleted"] as! Bool
      attributeString = snapshotValue["attributeString"] as! NSMutableAttributedString
      reference = snapshot.ref
   }
   
   func toAnyObject() -> Any {
      return [
         "itemTitle": itemTitle,
         "itemDescription": itemDescription,
         "taskCompleted": taskCompleted,
      ]
   }
   
}



var createdToDoLists = [ToDoList]()



