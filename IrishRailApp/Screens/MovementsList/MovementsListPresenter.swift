//
//  MovementsListPresenter.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 2.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class MovementsListPresenter: MovementsListPresentationLogic {

    private(set) weak var controller: MovementsListDisplayLogic?

    init(output: MovementsListDisplayLogic) {
        controller = output
    }
    
    func presentTrainMovements(trains: [TrainMovementModel]) {
        controller?.displayTrainsMovements(trains: trains)
    }
    
    func presentError(error: NSError) {
        controller?.displayTrainFailure(error: error)
    }
}

// MARK: - Clean Swift Protocols

protocol MovementsListPresentationLogic {
    func presentTrainMovements(trains: [TrainMovementModel])
    func presentError(error: NSError)
}
