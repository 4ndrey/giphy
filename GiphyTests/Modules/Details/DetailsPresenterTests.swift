//
//  DetailsPresenterTests.swift
//  Giphy
//
//  Created by Andrey Toropchin on 29.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import XCTest
@testable import Giphy

class DetailsPresenterTests: XCTestCase {
    var sut: DetailsPresenter!
    
    override func setUp() {
        super.setUp()
        sut = DetailsPresenter(repository: GifsNetworkRepository())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testShowDetails() {
        let output = MockDetailsPresenterOutput()

        sut.output = output
        sut.getGifDetails(model: GifModel(id: "feqkVgjJpYtjy", videoUrl: "", slug: ""))
        
        XCTAssert(output.isGifDetailsShown, "Gif details wasn't shown")
    }

    func testFailure() {
        let output = MockDetailsPresenterOutput()

        let failableRepository = GifsRepository()
        sut = DetailsPresenter(repository: failableRepository)
        sut.output = output
        sut.getGifDetails(model: GifModel(id: "feqkVgjJpYtjy", videoUrl: "", slug: ""))

        XCTAssert(output.shownErrorMessage != nil, "No error with failable repository")
    }
}
