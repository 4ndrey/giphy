//
//  DetailsPresenterProtocols.swift
//  Giphy
//
//  Created by Andrey Toropchin on 25.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

protocol DetailsPresenterInput {
    func getGifDetails(model: GifModel)
}

protocol DetailsPresenterOutput: AnyObject {
    func showGifDetails(model: GifDetailsModel)
    func showError(message: String)
}
