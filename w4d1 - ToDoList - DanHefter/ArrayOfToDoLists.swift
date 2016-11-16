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
   var title: String
   var itemsOnList = [String]()
   init(title: String) {
      self.title = title
   }
}

var createdToDoLists = [ToDoList]()
var savedItemTitle = String()

