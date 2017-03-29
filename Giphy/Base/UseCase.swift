//
//  UseCase.swift
//  Giphy
//
//  Created by Andrey Toropchin on 26.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

protocol UseCase {
    associatedtype ResultType
    associatedtype ParamsType
    func execute(params: ParamsType) throws -> ResultType
}
