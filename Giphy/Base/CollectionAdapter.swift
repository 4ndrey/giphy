//
//  CollectionAdapter.swift
//  Giphy
//
//  Created by Andrey Toropchin on 26.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import UIKit

class CollectionAdapter<Item, Cell: BaseCollectionCell>: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

    private weak var collectionView: UICollectionView?
    private var items = [Item]()
    var didSelect: ((Item) -> Void)?

    init(collectionView: UICollectionView) {
        super.init()

        collectionView.register(UINib(nibName: Cell.nibName, bundle: nil), forCellWithReuseIdentifier: Cell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView = collectionView
    }

    func update(collection: [Item], page: Int) {
        if page == 0 {
            items = collection
            collectionView?.reloadData()
        }
        else {
            items += collection
            collectionView?.performBatchUpdates({ self.collectionView?.insertItems(at: IndexPath.arrayFor(page: page, limit: collection.count)) }, completion: nil)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as! Cell).updateWithItem(items[indexPath.row] as AnyObject)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let didSelect = didSelect {
            didSelect(items[indexPath.row])
        }
    }
}
