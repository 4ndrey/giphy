//
//  Tasks.swift
//  Giphy
//
//  Created by Andrey Toropchin on 29.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import Foundation

class BackgroundTask {
    class func execute(_ action: @escaping () -> Void) {
        if isTesting {
            action()
        }
        else {
            DispatchQueue.global().async { action() }
        }
    }
}

class MainTask {
    class func execute(_ action: @escaping () -> Void) {
        if isTesting {
            action()
        }
        else {
            DispatchQueue.main.async { action() }
        }
    }
}
