//
//  ListPresenterTests.swift
//  Giphy
//
//  Created by Andrey Toropchin on 29.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import XCTest
@testable import Giphy

class ListPresenterTests: XCTestCase {
    var sut: ListPresenter!
    
    override func setUp() {
        super.setUp()
        sut = ListPresenter(repository: GifsNetworkRepository())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testShowTrending() {
        let output = MockListPresenterOutput()

        sut.output = output

        sut.showTrending()
        XCTAssert(output.pageLoaded == 0, "Show trending should update collection with page 0")

        sut.loadMore(query: nil)
        XCTAssert(output.pageLoaded == 1, "Show trending next page should update collection with page 1")
    }

    func testSearch() {
        let output = MockListPresenterOutput()

        sut.output = output

        sut.search(query: "test")
        XCTAssert(output.pageLoaded == 0, "Search should update collection with page 0")

        sut.loadMore(query: nil)
        XCTAssert(output.pageLoaded == 1, "Search next page should update collection with page 1")
    }

    func testFailure() {
        let output = MockListPresenterOutput()

        let failableRepository = GifsRepository()
        sut = ListPresenter(repository: failableRepository)
        sut.output = output
        sut.showTrending()

        XCTAssert(output.shownErrorMessage != nil, "No error with failable repository")
    }

    func testShowErrorAndTrendingIfNothingFound() {
        let output = MockListPresenterOutput()

        sut.output = output
        sut.search(query: "fdnlkf2j390rj20fasklnfn2") // should be not found

        XCTAssert(output.shownErrorMessage!.hasPrefix("Nothing found"), "No alert if nothing fould")
        XCTAssert(output.pageLoaded == 0, "Show trending should update collection with page 0")
    }
}
