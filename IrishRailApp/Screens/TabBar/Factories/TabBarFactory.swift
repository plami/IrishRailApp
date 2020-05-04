//
//  TabBarFactory.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

class TabBarFactory {

    static func childViewControllerForModel(_ model: TabBarModel.ViewModel) -> UIViewController {
        
        let viewController: UIViewController?
        
        switch model.type {
        case .stations:
            viewController = AllStationsViewController()
        case .trains:
            viewController = AllTrainsViewController()
        case .movements:
            viewController = MovementsViewController()
        }
        
        viewController?.tabBarItem = model.tabBarItem
        guard let vc = viewController else {
            fatalError("No View Controller!!!")
        }
        return vc
    }
}
