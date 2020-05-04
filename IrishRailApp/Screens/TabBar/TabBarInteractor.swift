//
//  TabBarInteractor.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class TabBarInteractor: TabBarBusinessLogic {

    let presenter: TabBarPresentationLogic!

    init(output: TabBarPresentationLogic) {
        
        presenter = output
    }
}

extension TabBarInteractor {

    func requestChildren() {
        let response = TabBarModel.Response(children: TabBarItemType.allCases,
                                            isError: false,
                                            errorMessage: nil)
        presenter.presentChildren(response)
    }
}

// MARK: - Clean Swift Protocols

protocol TabBarBusinessLogic {

    func requestChildren()
}
