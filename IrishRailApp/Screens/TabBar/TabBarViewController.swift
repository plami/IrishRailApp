//
//  TabBarViewController.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    // MARK: - Storyboard instance
    // NOTE: We have only one storyboard and we are working with xibs at all
    static func storyboardInstance() -> TabBarViewController? {
        let storyboard = UIStoryboard.main
        return storyboard.controllerWithID(StoryboardID.tabBarViewController) as? TabBarViewController
    }

    // MARK: - Clean Swift properties

    var interactor: TabBarBusinessLogic!
    var router: TabBarRouterLogic!

    // MARK: - Object lifecycle

    init() {
        super.init(nibName: nil, bundle: nil)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }

    // MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tabBar.tintColor = UIColor.init(hex: Constants.Colors.main)
        requestChildrenControllers()
        
    }

    // MARK: - Setup

    func configure() {
        TabBarConfigurator.shared.config(viewController: self)
    }

}

// MARK: - Internal Logic

extension TabBarViewController {

    private func requestChildrenControllers() {
        
        interactor.requestChildren()
    }
}

// MARK: - conform to TabBarViewControllerProtocol

extension TabBarViewController: TabBarDisplayLogic {

    func loadChildrenControllers(_ model: [TabBarModel.ViewModel]) {
        viewControllers = model.map { model in
            let viewController = TabBarFactory.childViewControllerForModel(model)
            return NavigationController(rootViewController: viewController)
        }
    }

    func errorLoadChildrenControllers(_ message: String) {
        // TODO: - show error message and/or empty state for the viewController
    }
}

// MARK: - Clean Swift Protocols

protocol TabBarDisplayLogic: class {

    func loadChildrenControllers(_ model: [TabBarModel.ViewModel])
    func errorLoadChildrenControllers(_ message: String)
}
