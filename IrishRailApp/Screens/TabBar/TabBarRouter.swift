//
//  TabBarRouter.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class TabBarRouter: TabBarRouterLogic {

    private(set) weak var viewController: TabBarDisplayLogic?

    init(viewController: TabBarDisplayLogic) {
        
        self.viewController = viewController
    }
}

// MARK: - Clean Swift Protocols

protocol TabBarRouterLogic { }
