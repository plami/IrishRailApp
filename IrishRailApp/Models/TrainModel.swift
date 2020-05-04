//
//  TrainModel.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation
import XMLMapper

class AllTrainsModel: XMLMappable {
    var nodeName: String!

    var trains: [TrainModel]?
    
    required init?(map: XMLMap) {}

    func mapping(map: XMLMap) {
        trains <- map["objTrainPositions"]
    }
}

class TrainModel: XMLMappable {
    var nodeName: String!

    var TrainStatus: String?
    var TrainLatitude: String?
    var TrainLongitude: String?
    var TrainCode: String?
    var TrainDate: String?
    var PublicMessage: String?
    var Direction: String?

    required init(map: XMLMap) {

    }

    func mapping(map: XMLMap) {
        TrainStatus <- map["TrainStatus"]
        TrainLatitude <- map["TrainLatitude"]
        TrainLongitude <- map["TrainLongitude"]
        TrainCode <- map["TrainCode"]
        TrainDate <- map["TrainDate"]
        PublicMessage <- map["PublicMessage"]
        Direction <- map["Direction"]
    }
}
