//
//  AllTrainsPresenter.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class AllTrainsPresenter: AllTrainsPresentationLogic {

    private(set) weak var controller: AllTrainsDisplayLogic?

    init(output: AllTrainsDisplayLogic) {
        controller = output
    }
    
    func presentTrains(trains: [TrainModel]) {
        controller?.displayTrains(trains: trains)
    }
    
    func presentError(error: NSError) {
        controller?.displayTrainFailure(error: error)
    }
    
    func presentTrainsByType(trains: [TrainModel]) {
        controller?.displayTrains(trains: trains)
    }
}

// MARK: - Clean Swift Protocols

protocol AllTrainsPresentationLogic {
    func presentTrains(trains: [TrainModel])
    func presentError(error: NSError)
    func presentTrainsByType(trains: [TrainModel])
}
