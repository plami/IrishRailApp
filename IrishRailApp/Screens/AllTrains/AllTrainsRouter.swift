//
//  AllTrainsRouter.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class AllTrainsRouter: AllTrainsRouterLogic {

    private(set) weak var viewController: AllTrainsDisplayLogic?

    init(viewController: AllTrainsDisplayLogic) {
        self.viewController =  viewController
    }
}

// MARK: - Clean Swift Protocols

protocol AllTrainsRouterLogic { }
