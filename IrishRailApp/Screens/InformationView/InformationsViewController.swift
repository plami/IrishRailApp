//
//  InformationsViewController.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

class InformationsViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDetails: UILabel!
    
    // MARK: - Clean Swift properties
     
     var interactor: InformationsBusinessLogic!
     var router: InformationsRouterLogic!
     
     // MARK: - Object lifecycle
     
     init() {
         super.init(nibName: nil, bundle: nil)
         configure()
     }
     
     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         configure()
     }
     
     // MARK: - Setup
     
     func configure() {
         InformationsConfigurator.shared.config(viewController: self)
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(hex: Constants.Colors.main)
        self.labelTitle.textColor = UIColor.white
        self.labelDetails.textColor = UIColor.white
        
    }
    
    @IBAction private func buttonContinueTap(_ sender: ACRoundButton) {
        guard let tabBarViewController = TabBarViewController.storyboardInstance() else { return }
        self.present(tabBarViewController, animated: true, completion: nil)    }
}

extension InformationsViewController: InformationsDisplayLogic {
}

// MARK: - Clean Swift Protocols

protocol InformationsDisplayLogic: class {
    
}
