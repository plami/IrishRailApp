//
//  InformationsInteractor.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//
import Foundation

class InformationsInteractor: InformationsBusinessLogic {

    let presenter: InformationsPresentationLogic!

    init(output: InformationsPresentationLogic) {
        presenter = output
    }
}

// MARK: - Clean Swift Protocols

protocol InformationsBusinessLogic {
}
