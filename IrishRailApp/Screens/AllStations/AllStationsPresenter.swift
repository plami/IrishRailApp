//
//  AllStationsPresenter.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class AllStationsPresenter: AllStationsPresentationLogic {

    private(set) weak var controller: AllStationsDisplayLogic?

    init(output: AllStationsDisplayLogic) {
        controller = output
    }
    
    func presentStations(stations: [StationModel]) {
        controller?.displayStations(stations: stations)
    }
    
    func presentStationsByType(stations: [StationModel]) {
        controller?.displayStations(stations: stations)
    }
    
    func presentError(error: NSError) {
        controller?.displayNewsFailure(error: error)
    }
}

// MARK: - Clean Swift Protocols

protocol AllStationsPresentationLogic {
    
    func presentStations(stations: [StationModel])
    func presentStationsByType(stations: [StationModel])
    func presentError(error: NSError)
}
