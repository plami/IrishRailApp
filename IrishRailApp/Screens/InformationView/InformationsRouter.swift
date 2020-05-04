//
//  InformationsRouter.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class InformationsRouter: InformationsRouterLogic {

    private(set) weak var viewController: InformationsDisplayLogic?

    init(viewController: InformationsDisplayLogic) {
        self.viewController =  viewController
    }
    
}

// MARK: - Clean Swift Protocols

protocol InformationsRouterLogic { }

