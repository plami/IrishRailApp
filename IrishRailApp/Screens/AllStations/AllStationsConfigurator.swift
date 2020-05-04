//
//  AllStationsConfigurator.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class AllStationsConfigurator {

    // MARK: - Singleton

    static var shared = AllStationsConfigurator()
    private init() { }

    func config(viewController: AllStationsViewController) {
        let presenter = AllStationsPresenter(output: viewController)
        let router = AllStationsRouter(viewController: viewController)
        let interactor = AllStationsInteractor(output: presenter)
        viewController.interactor = interactor
        viewController.router = router
    }
    
}
