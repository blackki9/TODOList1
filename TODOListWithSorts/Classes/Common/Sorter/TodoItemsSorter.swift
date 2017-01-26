//
//  TodoItemsSorter.swift
//  TODOListWithSorts
//
//  Created by Vyacheslav Okulov on 1/16/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import Foundation

protocol TodoItemsSorter {
    
    func sortItems(items:[TodoItem]) -> [TodoItem]
    
}
