//
//  TodoItemTests.swift
//  TODOListWithSorts
//
//  Created by Vyacheslav Okulov on 1/16/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import XCTest

@testable import TODOListWithSorts

class TodoItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDefaultInit() {
        let date = Date()
        let todoItem = TodoItem()
        
        XCTAssert(todoItem.priority == .normal)
        XCTAssert(todoItem.title == "")
        
        let unitFlags = Set<Calendar.Component>([.hour, .day, .month, .year])
        let firstComponents = NSCalendar.current.dateComponents(unitFlags, from: date)
        let secondComponents = NSCalendar.current.dateComponents(unitFlags, from: todoItem.date)

        XCTAssert(firstComponents.day == secondComponents.day)
        XCTAssert(firstComponents.month == secondComponents.month)
        XCTAssert(firstComponents.year == secondComponents.year)
        XCTAssert(firstComponents.hour == secondComponents.hour)
        XCTAssert(firstComponents.minute == secondComponents.minute)
    }
    
    func testFullInit() {
        let date = Date(timeInterval: 5000, since: Date())
        let todoItem = TodoItem(title:"Test full init", priority:.high, date:date)
        
        XCTAssert(todoItem.title == "Test full init")
        XCTAssert(todoItem.priority == .high)
        
        XCTAssert(todoItem.date.timeIntervalSince1970 == date.timeIntervalSince1970)
    }
    
    func testDefaultValues() {
        let todoItem = TodoItem(title:"Item with default values")
        let date = Date()
        
        XCTAssert(todoItem.title == "Item with default values")

        XCTAssert(todoItem.priority == .normal)
        
        let unitFlags = Set<Calendar.Component>([.hour, .day, .month, .year])
        let firstComponents = NSCalendar.current.dateComponents(unitFlags, from: date)
        let secondComponents = NSCalendar.current.dateComponents(unitFlags, from: todoItem.date)
        
        XCTAssert(firstComponents.day == secondComponents.day)
        XCTAssert(firstComponents.month == secondComponents.month)
        XCTAssert(firstComponents.year == secondComponents.year)
        XCTAssert(firstComponents.hour == secondComponents.hour)
        XCTAssert(firstComponents.minute == secondComponents.minute)
        
    }
}
