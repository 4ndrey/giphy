//
//  DetailsConfigurator.swift
//  Giphy
//
//  Created by Andrey Toropchin on 25.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

class DetailsConfigurator {

    class func configure(_ viewController: DetailsViewController) {
        let presenter = DetailsPresenter(repository: GifsNetworkRepository())
        presenter.output = viewController
        viewController.presenter = presenter
        viewController.router = DetailsRouter()
        viewController.router.viewController = viewController
    }
}
