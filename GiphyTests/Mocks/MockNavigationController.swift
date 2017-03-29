//
//  MockNavigationController.swift
//  Giphy
//
//  Created by Andrey Toropchin on 29.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import UIKit

class MockNavigationController: UINavigationController {

    var pushedControllerType: AnyClass?

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedControllerType = type(of: viewController)
    }
}
