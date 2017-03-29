//
//  main.swift
//  Giphy
//
//  Created by Andrey Toropchin on 29.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import UIKit

let appDelegateClass: AnyClass? = NSClassFromString("GiphyTests.TestingAppDelegate") ?? AppDelegate.self
let args = UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc))
UIApplicationMain(CommandLine.argc, args, nil, NSStringFromClass(appDelegateClass!))
