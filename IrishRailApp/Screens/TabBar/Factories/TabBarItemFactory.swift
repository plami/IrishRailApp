//
//  TabBarItemFactory.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

class TabBarItemFactory {

    static func create(type: TabBarItemType) -> UITabBarItem {
        switch type {
        case .stations:
            return UITabBarItem(title: "Stations",
                                image: UIImage(systemName: "star.circle"),
                                selectedImage: UIImage(systemName: "star.circle"))
        case .trains:
            return UITabBarItem(title: "Trains",
                                image: UIImage(systemName: "text.bubble"),
                                selectedImage: UIImage(systemName: "text.bubble"))
        case .movements:
            return UITabBarItem(title: "Train stops",
                                image: UIImage(systemName: "calendar.circle.fill"),
                                selectedImage: UIImage(systemName: "calendar.circle.fill"))
        }
    }
}

