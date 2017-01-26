//
//  TODOItem.swift
//  TODOListWithSorts
//
//  Created by Vyacheslav Okulov on 1/16/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import UIKit



class TodoItem: NSObject {
    enum TodoItemPriorityLevels {
        case normal
        case high
        
        func colorString() -> String {
            var result = ""
            switch self {
            case .normal :
                result = "ffffff"
            case .high:
                result = "ff0000"
            }
            
            return result
        }
    }
    
    var priority:TodoItemPriorityLevels
    var title:String
    var date:Date
    
    convenience override init() {
        self.init(title:"")
    }
    
    init(title:String, priority:TodoItemPriorityLevels = .normal, date:Date = Date()) {
        self.title = title
        self.priority = priority
        self.date = date
        super.init()

    }
}
