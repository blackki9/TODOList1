//
//  TodoItemsSorterTests.swift
//  TODOListWithSorts
//
//  Created by Vyacheslav Okulov on 1/16/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import XCTest

@testable import TODOListWithSorts

class TodoItemsSorterTests: XCTestCase {

    var items:[TodoItem]!
    var sorter:TodoItemsSorter!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of  each test method in the class.
        let defaultItem = TodoItem()
        let normalPriorityAndCustomDateItem = TodoItem(title: "Normal priority item with current date", priority:.normal, date:Date(timeIntervalSinceNow: 100))
        let highPriorityAndCurrentDateItem = TodoItem(title: "High priority item with current date", priority: .high)
        let highPriorityWithCustomDateItem = TodoItem(title: "High priority item with custom date", priority: .high, date: Date(timeIntervalSince1970: 1000))
        items = [highPriorityAndCurrentDateItem, normalPriorityAndCustomDateItem, defaultItem,highPriorityWithCustomDateItem]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        items = nil
        sorter = nil
    }

    func testSortingAscendingByPriorities() {
        sorter = TodoItemsAscendingPrioritySorter()
        
        let sortedItems = sorter.sortItems(items:items)
        
        XCTAssert(sortedItems[0].priority == .normal)
        XCTAssert(sortedItems[1].priority == .normal)
        XCTAssert(sortedItems[2].priority == .high)
        XCTAssert(sortedItems[3].priority == .high)
    }
    
    func testSortindDescendingByPriorities() {
        sorter = TodoItemsDescendingPrioritySorter()
        
        let sortedItems = sorter.sortItems(items: items)
        
        XCTAssert(sortedItems[0].priority == .high)
        XCTAssert(sortedItems[1].priority == .high)
        XCTAssert(sortedItems[2].priority == .normal)
        XCTAssert(sortedItems[3].priority == .normal)
    }
    
    func testSortingAscendingByDate() {
        sorter = TodoItemsAscendingDatesSorter()
        
        let sortedItems = sorter.sortItems(items: items)
        
        XCTAssert(sortedItems[0].title == "High priority item with custom date")
        XCTAssert(sortedItems[3].title == "Normal priority item with current date")
    }
    
    func testSortingDescendingByDate() {
        sorter = TodoItemsDescendingDateSorter()
        
        let sortedItems = sorter.sortItems(items: items)
        
        XCTAssert(sortedItems[0].title == "Normal priority item with current date")
        XCTAssert(sortedItems[3].title == "High priority item with custom date")
    }
    
    
}
