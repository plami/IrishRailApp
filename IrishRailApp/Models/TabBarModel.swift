//
//  TabBarModel.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

enum TabBarModel {

    struct Response {

        var children: [TabBarItemType]
        var isError: Bool
        var errorMessage: String?
    }

    struct ViewModel {
        var type: TabBarItemType
        var tabBarItem: UITabBarItem {
            return TabBarItemFactory.create(type: type)
        }
    }
}

enum TabBarItemType: CaseIterable {
    case stations
    case trains
    case movements
}
