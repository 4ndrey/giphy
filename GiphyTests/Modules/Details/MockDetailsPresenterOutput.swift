//
//  MockDetailsPresenterOutput.swift
//  Giphy
//
//  Created by Andrey Toropchin on 29.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

@testable import Giphy

class MockDetailsPresenterOutput: DetailsPresenterOutput {
    var isGifDetailsShown = false
    var shownErrorMessage: String?

    func showGifDetails(model: GifDetailsModel) {
        isGifDetailsShown = true
    }

    func showError(message: String) {
        shownErrorMessage = message
    }
}
