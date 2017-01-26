//
//  TodoItemsAscendingDatesSorter.swift
//  TODOListWithSorts
//
//  Created by Vyacheslav Okulov on 1/16/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import UIKit

class TodoItemsAscendingDatesSorter: NSObject, TodoItemsSorter {

    func sortItems(items: [TodoItem]) -> [TodoItem] {
        return items.sorted(by: { (first, second) -> Bool in
            return first.date < second.date
        })
    }
    
}
