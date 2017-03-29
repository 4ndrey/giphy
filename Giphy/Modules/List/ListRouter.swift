//
//  ListRouter.swift
//  Giphy
//
//  Created by Andrey Toropchin on 25.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import UIKit

protocol ListRouterInput: Router {
    func openDetails(model: GifModel)
}

class ListRouter: ListRouterInput {
    
    weak var viewController: UIViewController?

    func openDetails(model: GifModel) {
        let detailsVC = DetailsViewController()
        viewController?.navigationController?.pushViewController(detailsVC, animated: true)
        detailsVC.presenter.getGifDetails(model: model)
    }
}
