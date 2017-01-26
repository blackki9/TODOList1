//
//  ItemsListInteractorTests.swift
//  TODOListWithSorts
//
//  Created by Vyacheslav Okulov on 1/18/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import XCTest

@testable import TODOListWithSorts

class ItemstListInteractorOutputSpy : ItemsListInteractorOutput {
    var presentItemsWasCalled = false
    func presentItems(response: ItemsList.Response) {
        presentItemsWasCalled = true
    }
}

class ItemsListInteractorTests: XCTestCase {
    
    var interactor:ItemsListInteractor!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        interactor = ItemsListInteractor()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatInteractorCallsOutputPresentAllItems() {
        let spy = ItemstListInteractorOutputSpy()
        interactor.output = spy
        
        interactor.loadAndShowAllItems()
        
        XCTAssert(spy.presentItemsWasCalled)
    }
    
    
}
