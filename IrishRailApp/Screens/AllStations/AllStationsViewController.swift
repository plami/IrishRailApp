//
//  AllStationsViewController.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

class AllStationsViewController: UIViewController {

    // MARK: - IBOutlets & Properties
    
    @IBOutlet private weak var stationsTableView: UITableView!
    private var stationList = [StationModel]()
    @IBOutlet weak var actiivityIndicator: UIActivityIndicatorView!
    
    // MARK: - Clean Swift properties
     
     var interactor: AllStationsBusinessLogic!
     var router: AllStationsRouterLogic!
     
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
         AllStationsConfigurator.shared.config(viewController: self)
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setViews()
        configTableViewProperties()
        setupServices()
    }
    
    // MARK: - Set Network services

    fileprivate func setupServices() {
        interactor.requestStations()
    }
    
    // MARK: - Set tableView
    
    private func configTableViewProperties() {
        stationsTableView.registerCells([StationTableViewCell.self])
        stationsTableView.showsVerticalScrollIndicator = false
        stationsTableView.backgroundColor = .clear
    }
    
    // MARK: - Set UI
    
    private func setViews() {
        let backBarButton = UIBarButtonItem(title: Constants.strings.Back, style: .done, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem  = backBarButton
        let filterBarButton = UIBarButtonItem(title: Constants.strings.Filter, style: .done, target: self, action: #selector(filter))
        self.navigationItem.rightBarButtonItem  = filterBarButton
        self.navigationController?.navigationBar.backgroundColor = UIColor.init(hex: Constants.Colors.main)
        actiivityIndicator.isHidden = false
        actiivityIndicator.startAnimating()
    }
    
    @objc func filter(){
        var actions: [(String, UIAlertAction.Style)] = []
        actions.append((Constants.stationAndTrainTypes.All, UIAlertAction.Style.default))
        actions.append((Constants.stationAndTrainTypes.Mainline, UIAlertAction.Style.default))
        actions.append((Constants.stationAndTrainTypes.Suburban, UIAlertAction.Style.default))
        actions.append((Constants.stationAndTrainTypes.Dart, UIAlertAction.Style.default))
        actions.append((Constants.strings.Cancel, UIAlertAction.Style.cancel))

        self.showActionsheet(viewController: self, title: Constants.strings.FilterStations, message: "", actions: actions) { (index) in
            
            switch index {
            case 0:
                self.interactor.requestStationsByType(type: Constants.stationAndTrainNetworking.All)
            case 1:
                self.interactor.requestStationsByType(type: Constants.stationAndTrainNetworking.Mainline)
            case 2:
                self.interactor.requestStationsByType(type: Constants.stationAndTrainNetworking.Suburban)
            case 3:
                self.interactor.requestStationsByType(type: Constants.stationAndTrainNetworking.Dart)
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

extension AllStationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stationList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: StationTableViewCell = tableView.dequeueCell(StationTableViewCell.self)
        let currentStation = self.stationList[indexPath.item]
        guard let direction = currentStation.StationDesc,
            let stationCode = currentStation.StationCode,
            let stationLatitude = currentStation.StationLatitude,
            let stationLongitude= currentStation.StationLongitude
        else {
                return UITableViewCell()
        }
        cell.configureCell(withDirection: direction, withCode: stationCode, withLatitude: stationLatitude, withLongitude: stationLongitude)
        
        return cell
    }
}

extension AllStationsViewController: AllStationsDisplayLogic {
    func populateStations(stations: [StationModel]) {
        self.stationList = stations
        DispatchQueue.main.async {
            self.stationsTableView.reloadData()
            self.actiivityIndicator.isHidden = true
            self.actiivityIndicator.stopAnimating()
        }
    }
    
    func displayStations(stations: [StationModel]) {
        populateStations(stations: stations)
    }
    
    func displayNewsFailure(error: NSError) {
        self.showAlert(withTitle: "", message: error.localizedDescription, buttonTitle: Constants.strings.Ok, preferredStyle: .alert, completion: nil)
    }
}

// MARK: - Clean Swift Protocols

protocol AllStationsDisplayLogic: class {
    
    func displayStations(stations: [StationModel])
    func displayNewsFailure(error: NSError)
}
