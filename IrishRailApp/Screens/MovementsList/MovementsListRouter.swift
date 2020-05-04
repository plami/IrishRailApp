//
//  MovementsListRouter.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 2.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class MovementsListRouter: MovementsListRouterLogic {

    private(set) weak var viewController: MovementsListDisplayLogic?

    init(viewController: MovementsListDisplayLogic) {
        self.viewController =  viewController
    }
    
}

// MARK: - Clean Swift Protocols

protocol MovementsListRouterLogic { }
