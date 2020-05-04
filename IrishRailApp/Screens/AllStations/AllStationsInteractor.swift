//
//  AllStationsInteractor.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class AllStationsInteractor: AllStationsBusinessLogic {

    let presenter: AllStationsPresentationLogic!
    var worker = AllStationsWorker()
    var workerByType = StationsByTypeWorker()

    init(output: AllStationsPresentationLogic) {
        presenter = output
    }
    
    func requestStations() {
        
        worker.displayAll(completionHandler: { [weak self] stationsResult in
            switch stationsResult {
            case .success(let stations):
                self?.presenter.presentStations(stations: stations)
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
    
    func requestStationsByType(type: String) {
        workerByType.displayByType(withType: type,completionHandler: { [weak self] stationsResult in
            switch stationsResult {
            case .success(let stations):
                self?.presenter.presentStationsByType(stations: stations)
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

protocol AllStationsBusinessLogic {
    func requestStations()
    func requestStationsByType(type: String)
}
