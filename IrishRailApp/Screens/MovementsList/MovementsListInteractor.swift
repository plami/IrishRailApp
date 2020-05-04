//
//  MovementsListInteractor.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 2.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class MovementsListInteractor: MovementsListBusinessLogic {

    let presenter: MovementsListPresentationLogic!
    var worker = MovementsWorker()

    init(output: MovementsListPresentationLogic) {
        presenter = output
    }
    
    func requestTrainsMovements(withCode: String, withDate: String) {
        
        worker.displayByCode(withCode: withCode, withDate: withDate, completionHandler: { [weak self] trainsResult in
            switch trainsResult {
            case .success(let trains):
                self?.presenter.presentTrainMovements(trains: trains)
            case .failure(let error):
                self?.presenter.presentError(error: error as NSError)
            }
            }) { [weak self] error in
                switch error {
                case .success(let error):
                    self?.presenter.presentError(error: error as NSError)
                case .failure(let error):
                    self?.presenter.presentError(error: error as NSError)
                }
            }
    }
}

// MARK: - Clean Swift Protocols

protocol MovementsListBusinessLogic {
    func requestTrainsMovements(withCode: String, withDate: String)
}
