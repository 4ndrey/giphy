//
//  MockListPresenterOutput.swift
//  Giphy
//
//  Created by Andrey Toropchin on 29.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

@testable import Giphy

class MockListPresenterOutput: ListPresenterOutput {
    var pageLoaded: Int?
    var shownErrorMessage: String?

    func updateCollection(collection: [GifModel], page: Int) {
        if collection.count > 0 {
            pageLoaded = page
        }
    }

    func showError(message: String) {
        shownErrorMessage = message
    }
}
