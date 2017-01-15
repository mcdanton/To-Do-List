//
//  CoreDataLogic.swift
//  w4d1 - ToDoList - DanHefter
//
//  Created by Dan Hefter on 1/12/17.
//  Copyright © 2017 GA. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataModel {
   
   static let model = CoreDataModel()
   private init(){}
   
   lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   
   var allLists: [ToDoList] {
      
      var lists = [ToDoList]()
      let request: NSFetchRequest<ToDoList> = ToDoList.fetchRequest()
      
      do {
         lists = try context.fetch(request)
      } catch {
         print(error)
      }
      return lists
   }
   
   
   
   
   func createList(title:String) {
      let list = ToDoList(context: context)
      list.listTitle = title
      
      do {
         try context.save()
      } catch {
         print(error)
      }
   }
   
   
   func createItem(title:String, taskCompleted:Bool = false, description:String = "Add an item description") {
      let item = Item(context: context)
      item.itemTitle = title
   }
   
   
   func deleteList(list:ToDoList) {
      
      context.delete(list)
      
      do {
         try context.save()
      } catch {
         print(error)
      }
   }
   
   
   func deleteItem(item:Item) {
      
      context.delete(item)
      
      do {
         try context.save()
      } catch {
         print(error)
      }
   }
   
   
}

extension ToDoList {
   
   var arrayOfItemsOnList: [Item] {
      
      if self.item?.count == 0 {
         return [Item]()
      }
      
      return Array(self.item!) as! [Item]
   }
}



