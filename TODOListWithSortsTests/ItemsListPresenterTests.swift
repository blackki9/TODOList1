//
//  ItemsListPresenterTests.swift
//  TODOListWithSorts
//
//  Created by Vyacheslav Okulov on 1/18/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import XCTest

@testable import TODOListWithSorts

class ItemsListPresenterOutputSpy : ItemsListPresenterOutput {
    var displayItemsCalled = false
    var viewModel:ItemsList.ViewModel?
    
    func displayItems(viewModel:ItemsList.ViewModel) {
        displayItemsCalled = true
        self.viewModel = viewModel
    }
}

class ItemsListPresenterTests: XCTestCase {
 
    var presenter : ItemsListPresenter!
    var spy = ItemsListPresenterOutputSpy()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        presenter = ItemsListPresenter()
        presenter.output = spy
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        presenter = nil
    }
    
    func testThatPresenterCallsDisplayItemsWasCalled() {
        
        let response = ItemsList.Response(todoItems:[TodoItem]())
        
        presenter.presentItems(response: response)
        
        XCTAssert(spy.displayItemsCalled)
    }
    
    func testThatPresenterConvertResponseToViewModel() {
        
        let response = ItemsList.Response(todoItems:[TodoItem]())
        
        presenter.presentItems(response: response)
        
        XCTAssertNotNil(spy.viewModel)
    }
    
    func testThatPresenterConvertNotEmptyResponseToNotEmptyViewModel() {
        
        let response = ItemsList.Response(todoItems: [TodoItem()])
        
        presenter.presentItems(response:response)
        
        XCTAssert((spy.viewModel?.itemsToShow.count ?? 0) > 0)
    }
    
    func testThatPresenterProperlyConvertAndFormatsItemsForNormalPriority() {
        
        var components = DateComponents()
        components.year = 2007
        components.day = 6
        components.month = 9
        let calendar = Calendar.current
        
        let givenDate = calendar.date(from: components)!
        
        let givenItem = TodoItem(title: "Item with normal priority", priority: .normal, date: givenDate)
        
        let expectedDateString = "06/09/2007"
        let expectedColorString = TodoItem.TodoItemPriorityLevels.normal.colorString()
        
        let response = ItemsList.Response(todoItems: [givenItem])

        presenter.presentItems(response: response)
        
        let resultItem = spy.viewModel?.itemsToShow[0]
        
        XCTAssert(resultItem?.title == givenItem.title)
        XCTAssert(resultItem?.date == expectedDateString)
        XCTAssert(resultItem?.colorString == expectedColorString)
    }
    
    func testThatPresenterProperlySetColorForHighPriorityItem() {
        let item = TodoItem(title: "High priority item", priority: .high, date: Date())
        
        let response = ItemsList.Response(todoItems: [item])
        
        presenter.presentItems(response: response)
        
        let resultItem = spy.viewModel?.itemsToShow[0]
        
        XCTAssert(resultItem?.colorString == TodoItem.TodoItemPriorityLevels.high.colorString())
        
    }
 
}
