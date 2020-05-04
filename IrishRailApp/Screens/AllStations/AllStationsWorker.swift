//
//  AllStationsWorker.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 30.04.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation
import Alamofire
import XMLMapper

typealias OnSuccessCompletionHandlerStation = (Result<[StationModel]>) -> ()
typealias OnErrorHandler = (Result<NSError>) -> ()

class AllStationsWorker {
    
    private var stations = [StationModel]()
    
    func displayAll(completionHandler: @escaping OnSuccessCompletionHandlerStation,
    onErrorHandler: @escaping OnErrorHandler) {

        AF.request(AppConfiguration.urlAllStations, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
        .responseString { response in

            switch response.result {
            case .success(let value):
                let stationsMapped = XMLMapper<AllStationsModel>().map(XMLString: value)
                self.stations = stationsMapped!.stations!
                completionHandler(.success(self.stations))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
