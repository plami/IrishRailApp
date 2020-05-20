//
//  AllTrainsWorker.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation
import Alamofire
import XMLMapper

typealias OnSuccessCompletionHandlerTrains = (Result<[TrainModel]>) -> ()

class AllTrainsWorker {
    
    private var trains = [TrainModel]()
    
    func displayAll(completionHandler: @escaping OnSuccessCompletionHandlerTrains,
    onErrorHandler: @escaping OnErrorHandler) {

        AF.request(AppConfiguration.urlCurrentTrains, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
        .responseString { response in

            switch response.result {
            case .success(let value):
                guard let trainsMapped = XMLMapper<AllTrainsModel>().map(XMLString: value)
                    else { return }
                guard let trains = trainsMapped.trains else {
                    return
                }
                self.trains = trains
                completionHandler(.success(self.trains))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
