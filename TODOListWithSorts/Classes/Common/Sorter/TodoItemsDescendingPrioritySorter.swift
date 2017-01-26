//
//  TodoItemsDescendingPrioritySorter.swift
//  TODOListWithSorts
//
//  Created by Vyacheslav Okulov on 1/16/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import UIKit

class TodoItemsDescendingPrioritySorter: NSObject, TodoItemsSorter {

    func sortItems(items: [TodoItem]) -> [TodoItem] {
        return items.sorted(by: { (first, second) -> Bool in            
            return first.priority == .high
        })
    }
}
