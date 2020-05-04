//
//  AppDelegateConfigurator.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

class AppDelegateConfigurator {

    // MARK: - Singleton

    static var shared = AppDelegateConfigurator()
    
    private init() {}

    // MARK: - Setup

    func configure() {

        // Apply App Theme
        //ThemeManager.shared.applyTheme()

    }
}

