//
//  MovementsViewController.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 2.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

import UIKit

class MovementsViewController: UIViewController {

    // MARK: - IBOutlets & Properties
    
    @IBOutlet private weak var labelTrainID: UILabel!
    @IBOutlet private weak var labelDate: UILabel!
    @IBOutlet private weak var textFieldTrainID: UITextField!
    @IBOutlet private weak var textFieldDate: UITextField!
    private let datePicker = UIDatePicker()
    
    // MARK: - Clean Swift properties
     
     var interactor: MovementsBusinessLogic!
     var router: MovementsRouterLogic!
     
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
         MovementsConfigurator.shared.config(viewController: self)
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    // MARK: - Set UI
    
    private func setViews() {
        self.labelTrainID.textColor = UIColor.init(hex: Constants.Colors.main)
        self.labelDate.textColor = UIColor.init(hex: Constants.Colors.main)
        self.textFieldDate.addTarget(self, action: #selector(showDatePicker), for: .touchDown)
    }
    
    @objc func showDatePicker(){
          //Formate Date
          datePicker.datePickerMode = .date

         //ToolBar
         let toolbar = UIToolbar();
         toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: Constants.strings.Done, style: .plain, target: self, action: #selector(doneDatePicker));
           let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: Constants.strings.Cancel, style: .plain, target: self, action: #selector(cancelDatePicker));

        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

        textFieldDate.inputAccessoryView = toolbar
        textFieldDate.inputView = datePicker
    }
    
     @objc func doneDatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        textFieldDate.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }

    @objc func cancelDatePicker(){
       self.view.endEditing(true)
     }
    
    @IBAction private func buttonContinueTap(_ sender: ACRoundButton) {
        //example TrainID=e109
        let vc = MovementsListViewController()
        vc.TrainID = textFieldTrainID.text
        vc.Date = textFieldDate.text
        let navigationController = NavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .overFullScreen
        present(navigationController, animated: true, completion: nil)
    }
}

extension MovementsViewController: MovementsDisplayLogic {
}

// MARK: - Clean Swift Protocols

protocol MovementsDisplayLogic: class {
}

