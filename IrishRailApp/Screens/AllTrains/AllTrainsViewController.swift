//
//  AllTrainsViewController.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

class AllTrainsViewController: UIViewController {

    // MARK: - IBOutlets & Properties
    
    @IBOutlet private weak var trainsTableView: UITableView!
    private var trainList = [TrainModel]()
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Clean Swift properties
     
     var interactor: AllTrainsBusinessLogic!
     var router: AllTrainsRouterLogic!
     
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
         AllTrainsConfigurator.shared.config(viewController: self)
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableViewProperties()
        setViews()
        setupServices()
    }
    
    // MARK: - Set Network services
    
    fileprivate func setupServices() {
        interactor.requestTrains()
    }
    
    // MARK: - Set tableView
    
    private func configTableViewProperties() {
        trainsTableView.registerCells([TrainTableViewCell.self])
        trainsTableView.showsVerticalScrollIndicator = false
        trainsTableView.backgroundColor = .clear
    }
    
    // MARK: - Set UI
    
    private func setViews() {
        let backBarButton = UIBarButtonItem(title: Constants.strings.Back, style: .done, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem  = backBarButton
        let filterBarButton = UIBarButtonItem(title: Constants.strings.Filter, style: .done, target: self, action: #selector(filter))
        self.navigationItem.rightBarButtonItem  = filterBarButton
        self.navigationController?.navigationBar.backgroundColor = UIColor.init(hex: Constants.Colors.main)
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    @objc func filter(){
        var actions: [(String, UIAlertAction.Style)] = []
        actions.append((Constants.stationAndTrainTypes.All, UIAlertAction.Style.default))
        actions.append((Constants.stationAndTrainTypes.Mainline, UIAlertAction.Style.default))
        actions.append((Constants.stationAndTrainTypes.Suburban, UIAlertAction.Style.default))
        actions.append((Constants.stationAndTrainTypes.Dart, UIAlertAction.Style.default))
        actions.append((Constants.strings.Cancel, UIAlertAction.Style.cancel))

        self.showActionsheet(viewController: self, title: Constants.strings.FilterTrains, message: "", actions: actions) { (index) in
            
            switch index {
            case 0:
                self.interactor.requestTrainsByType(type: Constants.stationAndTrainNetworking.All)
            case 1:
                self.interactor.requestTrainsByType(type: Constants.stationAndTrainNetworking.Mainline)
            case 2:
                self.interactor.requestTrainsByType(type: Constants.stationAndTrainNetworking.Suburban)
            case 3:
                self.interactor.requestTrainsByType(type: Constants.stationAndTrainNetworking.Dart)
            default:
                break
            }
        }
    }
    
    @objc func back(){
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - TableView delegates

extension AllTrainsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TrainTableViewCell = tableView.dequeueCell(TrainTableViewCell.self)
        let currentTrain = self.trainList[indexPath.item]
        cell.configureCell(withDirection: currentTrain.Direction!, withDate: currentTrain.TrainDate!, withMessage: currentTrain.PublicMessage!)
        
        return cell
    }
}

extension AllTrainsViewController: AllTrainsDisplayLogic {
    func populateTrains(trains: [TrainModel]) {
        self.trainList = trains
        DispatchQueue.main.async {
            self.trainsTableView.reloadData()
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
        }
    }
    
    func displayTrains(trains: [TrainModel]) {
        populateTrains(trains: trains)
    }
    
    func displayTrainFailure(error: NSError) {
        self.showAlert(withTitle: "", message: error.localizedDescription, buttonTitle: Constants.strings.Ok, preferredStyle: .alert, completion: nil)
    }
}

// MARK: - Clean Swift Protocols

protocol AllTrainsDisplayLogic: class {
    func displayTrains(trains: [TrainModel])
    func displayTrainFailure(error: NSError)
}
