//
//  DetailsRouter.swift
//  Giphy
//
//  Created by Andrey Toropchin on 25.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import UIKit

protocol DetailsRouterInput: Router {
    func share(url: URL)
}

class DetailsRouter: DetailsRouterInput {

    weak var viewController: UIViewController?

    func share(url: URL) {
        let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        viewController?.present(activityViewController, animated: true, completion: nil)
    }
}
