//
//  AllStationsRouter.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class AllStationsRouter: AllStationsRouterLogic {

    private(set) weak var viewController: AllStationsDisplayLogic?

    init(viewController: AllStationsDisplayLogic) {
        self.viewController =  viewController
    }
}

// MARK: - Clean Swift Protocols

protocol AllStationsRouterLogic { }
