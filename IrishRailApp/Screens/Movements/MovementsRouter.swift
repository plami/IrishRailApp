//
//  MovementsRouter.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 2.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class MovementsRouter: MovementsRouterLogic {

    private(set) weak var viewController: MovementsDisplayLogic?

    init(viewController: MovementsDisplayLogic) {
        self.viewController =  viewController
    }
    
}

// MARK: - Clean Swift Protocols

protocol MovementsRouterLogic { }
