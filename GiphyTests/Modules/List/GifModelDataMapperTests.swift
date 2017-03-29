//
//  GifModelDataMapperTests.swift
//  Giphy
//
//  Created by Andrey Toropchin on 29.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import XCTest
@testable import Giphy

class GifModelDataMapperTests: XCTestCase {
    var sut: GifModelDataMapper!
    
    override func setUp() {
        super.setUp()
        sut = GifModelDataMapper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testTransform() {
        let gifShort = GifShort(id: "0", videoUrl: "http://vice3.agency", slug: "slug")
        let model = try! sut.transform(gif: gifShort)
        XCTAssert(model.id == gifShort.id)
        XCTAssert(model.videoUrl == gifShort.videoUrl)
        XCTAssert(model.slug == gifShort.slug)
    }

    func testTransformFailed() {
        let gifDetailed = GifDetailed(id: "", videoUrl: "", slug: "", shareUrl: "")
        do {
            _ = try sut.transform(gif: gifDetailed)
            XCTFail("No error from transform failed")
        } catch {}
    }
}
