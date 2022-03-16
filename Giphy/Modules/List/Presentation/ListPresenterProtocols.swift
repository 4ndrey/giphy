//
//  ListPresenterProtocols.swift
//  Giphy
//
//  Created by Andrey Toropchin on 25.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

protocol ListPresenterInput {
    func showTrending()
    func search(query: String)
    func loadMore(query: String?)
}

protocol ListPresenterOutput: AnyObject {
    func updateCollection(collection: [GifModel], page: Int)
    func showError(message: String)
}
