//
//  MovementsListConfigurator.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 2.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class MovementsListConfigurator {

    // MARK: - Singleton

    static var shared = MovementsListConfigurator()
    private init() { }

    func config(viewController: MovementsListViewController) {
        let presenter = MovementsListPresenter(output: viewController)
        let router = MovementsListRouter(viewController: viewController)
        let interactor = MovementsListInteractor(output: presenter)
        viewController.interactor = interactor
        viewController.router = router
    }
    
}
