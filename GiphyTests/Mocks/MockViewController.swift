//
//  MockViewController.swift
//  Giphy
//
//  Created by Andrey Toropchin on 29.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import UIKit

class MockViewController: UIViewController {
    lazy var mockNavigationController: MockNavigationController = MockNavigationController()
    var presenterControllerType: AnyClass?

    override var navigationController: UINavigationController? {
        return mockNavigationController
    }

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presenterControllerType = type(of: viewControllerToPresent)
    }
}
