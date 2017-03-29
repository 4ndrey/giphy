//
//  EndlessCollectionView.swift
//  Giphy
//
//  Created by Andrey Toropchin on 27.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import UIKit

typealias Handler = () -> Void
typealias OffsetHandler = (CGPoint) -> Void

class EndlessCollectionView: UICollectionView {

    var loadMore: Handler?
    var offsetHandler: OffsetHandler?

    private var _contentSize = CGSize.zero

    override func awakeFromNib() {
        super.awakeFromNib()

        self.addObserver(self, forKeyPath: "contentOffset", options: .new, context: nil)
    }

    deinit {
        self.removeObserver(self, forKeyPath: "contentOffset")
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let offsetY = contentOffset.y
        let contentHeight = contentSize.height - 150 // loadMore earlier
        if offsetY > contentHeight - frame.size.height {
            if contentSize.height > 0 && contentSize != _contentSize {
                if _contentSize != CGSize.zero {
                    if let handler = loadMore { handler() }
                }
                _contentSize = contentSize
            }
        }
        if let handler = offsetHandler { handler(contentOffset) }
    }
}
