//
//  IndexPath.swift
//  Giphy
//
//  Created by Andrey Toropchin on 28.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import Foundation

extension IndexPath {
    static func arrayFor(page: Int, limit: Int) -> [IndexPath] {
        var result = [IndexPath]()
        for i in (page * limit)..<(page + 1) * limit {
            result.append(IndexPath(row: i, section: 0))
        }
        return result
    }
}
