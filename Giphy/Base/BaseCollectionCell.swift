//
//  BaseCollectionCell.swift
//  Giphy
//
//  Created by Andrey Toropchin on 27.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import UIKit

class BaseCollectionCell: UICollectionViewCell {
    class var nibName: String { return String(describing: self) }
    class var identifier: String { return String(describing: self) }
    func updateWithItem(_ item: AnyObject) {}
}
