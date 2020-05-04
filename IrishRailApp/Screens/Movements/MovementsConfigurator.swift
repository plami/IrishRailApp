//
//  MovementsConfigurator.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 2.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class MovementsConfigurator {

    // MARK: - Singleton

    static var shared = MovementsConfigurator()
    private init() { }

    func config(viewController: MovementsViewController) {
        let presenter = MovementsPresenter(output: viewController)
        let router = MovementsRouter(viewController: viewController)
        let interactor = MovementsInteractor(output: presenter)
        viewController.interactor = interactor
        viewController.router = router
    }
}
