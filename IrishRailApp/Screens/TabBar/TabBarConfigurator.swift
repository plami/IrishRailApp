//
//  TabBarConfigurator.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class TabBarConfigurator {

    // MARK: - Singleton

    static var shared = TabBarConfigurator()
    
    private init() {}

    func config(viewController: TabBarViewController) {
        let presenter = TabBarPresenter(output: viewController)
        let router = TabBarRouter(viewController: viewController)
        let interactor = TabBarInteractor(output: presenter)
        viewController.interactor = interactor
        viewController.router = router
    }
}
