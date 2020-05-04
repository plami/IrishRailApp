//
//  MovementsListViewController.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 2.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

class MovementsListViewController: UIViewController {

    // MARK: - IBOutlets & Properties
    
    @IBOutlet private weak var trainsTableView: UITableView!
    @IBOutlet weak var viewNoResults: UIView!
    @IBOutlet weak var labelNoResults: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var trainList = [TrainMovementModel]()
    var TrainID: String?
    var Date: String?
    
    // MARK: - Clean Swift properties
     
     var interactor: MovementsListBusinessLogic!
     var router: MovementsListRouterLogic!
     
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
         MovementsListConfigurator.shared.config(viewController: self)
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableViewProperties()
        setViews()
        setupServices()
    }
    
    // MARK: - Set Network services
    
    fileprivate func setupServices() {
        guard let trainID = self.TrainID,
            let trainDate = self.Date else { return }
        interactor.requestTrainsMovements(withCode: trainID, withDate: trainDate)
    }
    
    // MARK: - Set tableView
    
    private func configTableViewProperties() {
        trainsTableView.delegate = self
        trainsTableView.dataSource = self
        trainsTableView.registerCells([MovementsTableViewCell.self])
        trainsTableView.showsVerticalScrollIndicator = false
        trainsTableView.backgroundColor = .clear
    }
    
     // MARK: - Setup
    
    private func setViews() {
        let backBarButton = UIBarButtonItem(title: Constants.strings.Back, style: .done, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem  = backBarButton
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }

    @objc func back(){
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - TableView delegates

extension MovementsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovementsTableViewCell = tableView.dequeueCell(MovementsTableViewCell.self)
        let currentTrain = self.trainList[indexPath.item]
        guard let destination = currentTrain.TrainDestination,
            let date = currentTrain.TrainDate,
            let locationFullName = currentTrain.LocationFullName,
            let locationCode = currentTrain.LocationCode,
            let departure = currentTrain.ExpectedDeparture,
            let arrival = currentTrain.ExpectedArrival else {
                return UITableViewCell()
        }
        cell.configureCell(withDestination: destination, withDate: date, withLocation: locationFullName, withLocationCode: locationCode, withDeparture: departure, withArrival: arrival)
        
        return cell
    }
}

extension MovementsListViewController: MovementsListDisplayLogic {
    func populateTrains(trains: [TrainMovementModel]) {
        self.trainList = trains
        DispatchQueue.main.async {
            self.trainsTableView.reloadData()
            if self.trainList.isEmpty {
                self.viewNoResults.isHidden = false
                self.labelNoResults.textColor = UIColor.init(hex: Constants.Colors.main)
            } else {
                self.viewNoResults.isHidden = true
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    func displayTrainsMovements(trains: [TrainMovementModel]) {
        populateTrains(trains: trains)
    }
    
    func displayTrainFailure(error: NSError) {
        self.showAlert(withTitle: "", message: error.localizedDescription, buttonTitle: Constants.strings.Ok, preferredStyle: .alert, completion: nil)
    }
}

// MARK: - Clean Swift Protocols

protocol MovementsListDisplayLogic: class {
    func displayTrainsMovements(trains: [TrainMovementModel])
    func displayTrainFailure(error: NSError)
}
