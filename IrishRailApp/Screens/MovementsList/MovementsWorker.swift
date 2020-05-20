//
//  MovementsWorker.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 2.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation
import Alamofire
import XMLMapper

typealias OnSuccessCompletionHandlerMovements = (Result<[TrainMovementModel]>) -> ()

class MovementsWorker {
    
    private var trains = [TrainMovementModel]()
    
    func displayByCode(withCode: String, withDate: String, completionHandler: @escaping OnSuccessCompletionHandlerMovements,
    onErrorHandler: @escaping OnErrorHandler) {
        
        let url = AppConfiguration.urlTrainsMovements + withCode + "&TrainDate="
        let escapedString = withDate.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let finalUrl = url + escapedString
        AF.request(finalUrl as! URLConvertible, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
        .responseString { response in

            switch response.result {
            case .success(let value):
                guard let trainsMapped = XMLMapper<AllTrainsMovementModel>().map(XMLString: value)
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
