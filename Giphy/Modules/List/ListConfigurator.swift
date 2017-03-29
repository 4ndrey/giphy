//
//  ListConfigurator.swift
//  Giphy
//
//  Created by Andrey Toropchin on 25.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

class ListConfigurator {

    class func configure(_ viewController: ListViewController) {
        let presenter = ListPresenter(repository: GifsNetworkRepository())
        presenter.output = viewController
        viewController.presenter = presenter
        viewController.router = ListRouter()
        viewController.router.viewController = viewController
    }
}
