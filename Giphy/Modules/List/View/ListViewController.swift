//
//  ListViewController.swift
//  Giphy
//
//  Created by Andrey Toropchin on 25.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import UIKit

class ListViewController: BaseViewController {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var collectionView: EndlessCollectionView!
    @IBOutlet var searchBarTop: NSLayoutConstraint!

    var presenter: ListPresenterInput!
    var router: ListRouterInput!
    var adapter: CollectionAdapter<GifModel, GifModelCell>!

    override func configure() {
        ListConfigurator.configure(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Giphy"

        // Setup collection adapter
        adapter = CollectionAdapter(collectionView: collectionView)
        adapter.didSelect = { [weak self] model in
            self?.router.openDetails(model: model)
        }

        // Setup initial state and pagination
        presenter.showTrending()
        collectionView.loadMore = { [weak self] in
            self?.presenter.loadMore(query: self?.searchBar.text)
        }

        // Setup searchBar toggling
        let searchBarHeight = searchBar.bounds.height
        collectionView.offsetHandler = { [weak self] offset in
            let searchOffsetMax = self?.navigationController?.navigationBar.frame.maxY ?? 0
            let searchOffsetY = (self?.searchBarTop.constant ?? 0) + offset.y
            self?.searchBarTop.constant = offset.y <= 0 ? -searchBarHeight : min(searchOffsetMax, searchOffsetY)
        }
    }
}

extension ListViewController: ListPresenterOutput {
    func updateCollection(collection: [GifModel], page: Int) {
        adapter.update(collection: collection, page: page)
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            presenter.showTrending()
        }
        else {
            presenter.search(query: searchText)
        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
