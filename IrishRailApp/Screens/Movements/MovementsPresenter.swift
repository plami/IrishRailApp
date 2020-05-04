//
//  MovementsPresenter.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 2.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class MovementsPresenter: MovementsPresentationLogic {

    private(set) weak var controller: MovementsDisplayLogic?

    init(output: MovementsDisplayLogic) {
        controller = output
    }
}

// MARK: - Clean Swift Protocols

protocol MovementsPresentationLogic {
}
