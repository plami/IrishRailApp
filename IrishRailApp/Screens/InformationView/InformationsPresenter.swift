//
//  InformationsPresenter.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//
import Foundation

class InformationsPresenter: InformationsPresentationLogic {

    private(set) weak var controller: InformationsDisplayLogic?

    init(output: InformationsDisplayLogic) {
        controller = output
    }
    
}

// MARK: - Clean Swift Protocols

protocol InformationsPresentationLogic {
    
}
