//
//  AllTrainsConfigurator.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class AllTrainsConfigurator {

    // MARK: - Singleton

    static var shared = AllTrainsConfigurator()
    private init() { }

    func config(viewController: AllTrainsViewController) {
        let presenter = AllTrainsPresenter(output: viewController)
        let router = AllTrainsRouter(viewController: viewController)
        let interactor = AllTrainsInteractor(output: presenter)
        viewController.interactor = interactor
        viewController.router = router
    }
    
}
