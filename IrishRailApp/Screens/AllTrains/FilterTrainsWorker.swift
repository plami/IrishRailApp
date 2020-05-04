//
//  FilterTrainsWorker.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 2.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation
import Alamofire
import XMLMapper

class TrainsByTypeWorker {
    
    private var trains = [TrainModel]()
    
    func displayByType(withType: String, completionHandler: @escaping OnSuccessCompletionHandlerTrains,
    onErrorHandler: @escaping OnErrorHandler) {

        AF.request(AppConfiguration.urlTrainsByType + withType, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
        .responseString { response in
            switch response.result {
            case .success(let value):
                let trainsMapped = XMLMapper<AllTrainsModel>().map(XMLString: value)
                self.trains = trainsMapped!.trains!
                completionHandler(.success(self.trains))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
