//
//  Repository.swift
//  Giphy
//
//  Created by Andrey Toropchin on 26.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

protocol Repository {
    associatedtype Item
    func get(id: String) throws -> Item
    func getAll(query: Query) throws -> [Item]
}

protocol Query {}
