//
//  GifsRepository.swift
//  Giphy
//
//  Created by Andrey Toropchin on 27.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import Foundation

class GifsRepository: Repository {
    typealias Item = Gif

    func get(id: String) throws -> Gif {
        throw "Not implemented"
    }

    func getAll(query: Query) throws -> [Gif] {
        throw "Not implemented"
    }
}
