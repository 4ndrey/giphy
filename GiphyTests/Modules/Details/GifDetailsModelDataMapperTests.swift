//
//  GifDetailsModelDataMapperTests.swift
//  Giphy
//
//  Created by Andrey Toropchin on 29.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import XCTest
@testable import Giphy

class GifDetailsModelDataMapperTests: XCTestCase {
    var sut: GifDetailsModelDataMapper!
    
    override func setUp() {
        super.setUp()
        sut = GifDetailsModelDataMapper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testTransform() {
        let gifDetailed = GifDetailed(id: "1", videoUrl: "ya.ru", slug: "test", shareUrl: "ya.ru")
        let model = try! sut.transform(gif: gifDetailed)
        XCTAssert(model.id == gifDetailed.id)
        XCTAssert(model.videoUrl == gifDetailed.videoUrl)
        XCTAssert(model.slug == gifDetailed.slug)
        XCTAssert(model.shareUrl == gifDetailed.shareUrl)
    }

    func testTransformFailed() {
        let gifShort = GifShort(id: "", videoUrl: "", slug: "")
        do {
            _ = try sut.transform(gif: gifShort)
            XCTFail("No error from transform failed")
        } catch {}
    }
}
