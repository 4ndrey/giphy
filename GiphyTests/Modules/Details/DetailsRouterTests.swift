//
//  DetailsRouterTests.swift
//  Giphy
//
//  Created by Andrey Toropchin on 29.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import XCTest
@testable import Giphy

class DetailsRouterTests: XCTestCase {
    var sut: DetailsRouter!
    
    override func setUp() {
        super.setUp()
        sut = DetailsRouter()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSharing() {
        let mockVC = MockViewController()

        sut.viewController = mockVC
        sut.share(url: URL(string: "http://vice3.agency")!)
        
        XCTAssert(mockVC.presenterControllerType == UIActivityViewController.self, "UIActivityViewController wasn't shown")
    }
}
