//
//  GetGifDetails.swift
//  Giphy
//
//  Created by Andrey Toropchin on 26.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

class GetGifDetails: UseCase {
    typealias ResultType = Gif
    typealias ParamsType = String

    private let repository: GifsRepository

    init(repository: GifsRepository) {
        self.repository = repository
    }

    func execute(params: ParamsType) throws -> ResultType {
        return try repository.get(id: params)
    }
}
