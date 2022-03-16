//
//  GifsNetworkRepository.swift
//  Giphy
//
//  Created by Andrey Toropchin on 27.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import Foundation

class GifsNetworkRepository: GifsRepository {

    let parser = ResponseParser()

    override func get(id: String) throws -> Gif {
        let data = try Networking.getGif(id: id)
        let result = try parser.parse(data).first!
        return result
    }

    override func getAll(query: Query) throws -> [Gif] {
        guard let query = query as? RequestParams else { throw "Bad query" }
        let data: NSDictionary
        if query.q == nil || query.q!.count == 0 { data = try Networking.getGifs(limit: query.limit, offset: query.offset) }
        else { data = try Networking.searchGifs(query: query.q, limit: query.limit, offset: query.offset) }
        let result = try parser.parse(data)
        return result
    }
}

struct RequestParams: Query {
    let q: String?
    let limit: Int
    let offset: Int
}
