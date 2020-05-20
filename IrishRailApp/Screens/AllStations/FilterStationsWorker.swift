//
//  FilterStationsWorker.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 2.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation
import Alamofire
import XMLMapper

class StationsByTypeWorker {
    
    private var stations = [StationModel]()
    
    func displayByType(withType: String, completionHandler: @escaping OnSuccessCompletionHandlerStation,
    onErrorHandler: @escaping OnErrorHandler) {

        AF.request(AppConfiguration.urlAllStationsByType + withType, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
        .responseString { response in
            switch response.result {
            case .success(let value):
                guard let stationsMapped = XMLMapper<AllStationsModel>().map(XMLString: value)
                    else { return }
                guard let stations = stationsMapped.stations else {
                        return
                }
                self.stations = stations
                completionHandler(.success(self.stations))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
