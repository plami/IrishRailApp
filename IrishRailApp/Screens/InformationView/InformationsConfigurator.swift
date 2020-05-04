//
//  InformationsConfigurator.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//
import Foundation

class InformationsConfigurator {

    // MARK: - Singleton

    static var shared = InformationsConfigurator()
    private init() { }

    func config(viewController: InformationsViewController) {
        let presenter = InformationsPresenter(output: viewController)
        let router = InformationsRouter(viewController: viewController)
        let interactor = InformationsInteractor(output: presenter)
        viewController.interactor = interactor
        viewController.router = router
    }
    
}

