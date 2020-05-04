//
//  TabBarPresenter.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation

class TabBarPresenter: TabBarPresentationLogic {

    private(set) weak var controller: TabBarDisplayLogic?

    init(output: TabBarDisplayLogic) {
        
        controller = output
    }
}

extension TabBarPresenter {

    func presentChildren(_ model: TabBarModel.Response) {
        if model.isError, let message = model.errorMessage {
            controller?.errorLoadChildrenControllers(message)
            return
        }
        let viewModel = transform(response: model)
        controller?.loadChildrenControllers(viewModel)
    }

    private func transform(response: TabBarModel.Response) -> [TabBarModel.ViewModel] {
        return response.children.map { type in
            TabBarModel.ViewModel(type: type)
        }
    }
}

// MARK: - Clean Swift Protocols

protocol TabBarPresentationLogic {

    func presentChildren(_ model: TabBarModel.Response)
}
