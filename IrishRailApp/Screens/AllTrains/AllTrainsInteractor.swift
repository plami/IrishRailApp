//
//  AllTrainsInteractor.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class AllTrainsInteractor: AllTrainsBusinessLogic {

    let presenter: AllTrainsPresentationLogic!
    var worker = AllTrainsWorker()
    var workerByType = TrainsByTypeWorker()

    init(output: AllTrainsPresentationLogic) {
        presenter = output
    }
    
    func requestTrains() {
        
        worker.displayAll(completionHandler: { [weak self] trainsResult in
            switch trainsResult {
            case .success(let trains):
                self?.presenter.presentTrains(trains: trains)
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
    
    func requestTrainsByType(type: String) {
        
        workerByType.displayByType(withType: type, completionHandler: { [weak self] trainsResult in
            switch trainsResult {
            case .success(let trains):
                self?.presenter.presentTrainsByType(trains: trains)
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

protocol AllTrainsBusinessLogic {
    func requestTrains()
    func requestTrainsByType(type: String)
}
