//
//  ListRouterTests.swift
//  Giphy
//
//  Created by Andrey Toropchin on 29.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import XCTest
@testable import Giphy

class ListRouterTests: XCTestCase {
    var sut: ListRouter!
    
    override func setUp() {
        super.setUp()
        sut = ListRouter()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testOpenDetails() {
        let mockVC = MockViewController()

        sut.viewController = mockVC
        sut.openDetails(model: GifModel(id: "", videoUrl: "", slug: ""))
        
        XCTAssert(mockVC.mockNavigationController.pushedControllerType == DetailsViewController.self, "DetailsViewController wasn't shown")
    }
}
