//
//  ListPresenter.swift
//  Giphy
//
//  Created by Andrey Toropchin on 25.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import Foundation

class ListPresenter {

    weak var output: ListPresenterOutput?

    private let repository: GifsRepository
    fileprivate let dataMapper = GifModelDataMapper()
    fileprivate let getGifs: GetGifs

    fileprivate var page = 0
    fileprivate let limit = 20
    fileprivate var searchTask: DelayedTask?

    init(repository: GifsRepository) {
        self.repository = repository
        getGifs = GetGifs(repository: repository)
    }
}

extension ListPresenter: ListPresenterInput {

    func showTrending() {
        _loadData(searchText: nil, page: 0)
    }

    func search(query: String) {
        searchTask?.cancel()
        searchTask = DelayedTask(seconds: 0.5) { [weak self] in
            self?._loadData(searchText: query, page: 0)
        }
    }

    func loadMore(query: String?) {
        _loadData(searchText: query, page: page + 1)
    }

    private func _loadData(searchText: String?, page: Int) {
        BackgroundTask.execute {
            do {
                let params = RequestParams(q: searchText, limit: self.limit, offset: page * self.limit)
                let gifs = try self.getGifs.execute(params: params)
                let collection = try gifs.map { try self.dataMapper.transform(gif: $0) }
                self.page = page
                MainTask.execute {
                    if searchText != nil && page == 0 && collection.count == 0 {
                        self.output?.showError(message: "Nothing found :(\nShowing `trending` instead")
                        self.showTrending()
                    }
                    else {
                        self.output?.updateCollection(collection: collection, page: self.page)
                    }
                }
            }
            catch (let error) {
                MainTask.execute {
                    let message = error is String ? error as! String : error.localizedDescription
                    self.output?.showError(message: message)
                }
            }
        }
    }
}
