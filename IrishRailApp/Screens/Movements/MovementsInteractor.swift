//
//  MovementsInteractor.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 2.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class MovementsInteractor: MovementsBusinessLogic {

    let presenter: MovementsPresentationLogic!

    init(output: MovementsPresentationLogic) {
        presenter = output
    }
}

// MARK: - Clean Swift Protocols

protocol MovementsBusinessLogic {
}
