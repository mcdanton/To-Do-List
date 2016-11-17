//
//  ArrayOfToDoLists.swift
//  w4d1 - ToDoList - DanHefter
//
//  Created by Dan Hefter on 11/14/16.
//  Copyright © 2016 GA. All rights reserved.
//

import Foundation
import UIKit

class ToDoList {
   var listTitle: String
   var itemsOnList = [Item]()
   init(listTitle: String) {
      self.listTitle = listTitle
   }
}


class Item {
   
   var itemTitle: String
   var description: String = "Add an item description"
   
   init(itemTitle: String) {
      self.itemTitle = itemTitle
   }
}


var createdToDoLists = [ToDoList]()

