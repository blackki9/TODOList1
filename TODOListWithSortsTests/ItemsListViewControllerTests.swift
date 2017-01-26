//
//  ItemsListViewControllerTests.swift
//  TODOListWithSorts
//
//  Created by Vyacheslav Okulov on 1/17/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import XCTest

@testable import TODOListWithSorts

class ItemsListViewControllerOutputSpy : ItemsListViewControllerOutput {
    var loadAndShowAllItemsWasCalled:Bool = false
    func loadAndShowAllItems() {
        loadAndShowAllItemsWasCalled = true
    }
}

class ItemsListViewControllerTests: XCTestCase {
    
    var viewController:ItemsListViewController!
    var outputSpy:ItemsListViewControllerOutputSpy!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "ItemsListViewController") as! ItemsListViewController
        outputSpy = ItemsListViewControllerOutputSpy()
        viewController.output = outputSpy
        
        _ = viewController.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        viewController = nil
    }
   
    func testThatTableViewInitedAndHasDatasourceAndDelegate() {
        XCTAssertNotNil(viewController.tableView)
        XCTAssertNotNil(viewController.tableView.delegate)
        XCTAssertNotNil(viewController.tableView.dataSource)
    }
    
    func testThatCellForIndexPathReturnsProperCellType() {
        let cell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssert(cell.isKind(of: ItemsListTableViewCell.self))
    }
    
    func testThatTableViewCellHasLabels() {
        let cell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ItemsListTableViewCell
        
        XCTAssertNotNil(cell.titleLabel)
        XCTAssertNotNil(cell.dateLabel)
    }
    
    func testThatCellSetupProperValuesForLabels() {
        let cell = viewController.tableView(viewController.tableView, cellForRowAt : IndexPath(row:0, section : 0)) as! ItemsListTableViewCell
        
        let itemToShow = ItemsListShowData(title:"Item to show title", date:"06/09/2007", colorString:"f5f5f5")
        
        cell.configureCell(withItem:itemToShow)
        
        XCTAssert(cell.titleLabel.text == "Item to show title")
        XCTAssert(cell.dateLabel.text == "06/09/2007")
        let expectedColor = "f5f5f5".hexColor
        let givenColor = cell.contentView.backgroundColor!
        XCTAssert(givenColor.isEqual(expectedColor))
    }
    
    func testThatViewDidLoadCallsLoadAllItemsInOutput() {
        XCTAssert(outputSpy.loadAndShowAllItemsWasCalled)
    }
    
}
