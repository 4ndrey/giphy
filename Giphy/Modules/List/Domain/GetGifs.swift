//
//  GetGifs.swift
//  Giphy
//
//  Created by Andrey Toropchin on 26.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

class GetGifs: UseCase {
    typealias ResultType = [Gif]
    typealias ParamsType = RequestParams

    private let repository: GifsRepository

    init(repository: GifsRepository) {
        self.repository = repository
    }

    func execute(params: ParamsType) throws -> ResultType {
        return try repository.getAll(query: params)
    }
}
