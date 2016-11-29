//
//  ArrayOfToDoLists.swift
//  w4d1 - ToDoList - DanHefter
//
//  Created by Dan Hefter on 11/14/16.
//  Copyright © 2016 GA. All rights reserved.
//

import Foundation
import UIKit

class ToDoList: NSObject, NSCoding {
   var listTitle: String
   var itemsOnList = [Item]()
   
   
   init(listTitle: String) {
      self.listTitle = listTitle
   }
   
   
   
   // MARK: NSCoding
   func encode(with aCoder: NSCoder) {
      aCoder.encode(listTitle, forKey: PropertyKey.listTitle)
      aCoder.encode(itemsOnList, forKey: PropertyKey.itemsOnList)
   }
   
   required init?(coder aDecoder: NSCoder) {
      listTitle = aDecoder.decodeObject(forKey:(PropertyKey.listTitle)) as! String
      itemsOnList = aDecoder.decodeObject(forKey:(PropertyKey.itemsOnList)) as! [Item]
   }
}


class Item: NSObject, NSCoding {
   
   var itemTitle: String
   var itemDescription: String = "Add an item itemDescription"
   var taskCompleted: Bool = false
   var attributeString = NSMutableAttributedString()
   
   init(itemTitle: String) {
      self.itemTitle = itemTitle
   }
   
   
   
   // MARK: NSCoding
   func encode(with aCoder: NSCoder) {
      aCoder.encode(itemTitle, forKey: PropertyKey.itemTitle)
      aCoder.encode(itemDescription, forKey: PropertyKey.itemDescription)
      aCoder.encode(taskCompleted, forKey: PropertyKey.taskCompleted)
      aCoder.encode(attributeString, forKey: PropertyKey.attributeString)
   }
   
   required init?(coder aDecoder: NSCoder) {
      itemTitle = aDecoder.decodeObject(forKey:(PropertyKey.itemTitle)) as! String
      itemDescription = aDecoder.decodeObject(forKey:(PropertyKey.itemDescription)) as! String
      taskCompleted = aDecoder.decodeObject(forKey:(PropertyKey.taskCompleted)) as! Bool
      attributeString = aDecoder.decodeObject(forKey:(PropertyKey.attributeString)) as! NSMutableAttributedString
   }
}



var createdToDoLists = [ToDoList]()

struct PropertyKey {
   static let listTitle = "listTitle"
   static let itemsOnList = "itemsOnList"
   static let itemTitle = "itemTitle"
   static let itemDescription = "itemDescription"
   static let taskCompleted = "taskCompleted"
   static let attributeString = "attributeString"
}

