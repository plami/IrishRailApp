//
//  AppDelegate.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppDelegateConfigurator.shared.configure()
        startWithInformationFlow()
        return true
    }
    
    private func startWithInformationFlow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let informationViewController = InformationsViewController()
        window?.rootViewController = informationViewController
        window?.makeKeyAndVisible()
    }
}

