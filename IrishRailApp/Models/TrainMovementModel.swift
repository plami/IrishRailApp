//
//  TrainMovementModel.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 2.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation
import XMLMapper

class AllTrainsMovementModel: XMLMappable {
    var nodeName: String!

    var trains: [TrainMovementModel]?
    
    required init?(map: XMLMap) {}

    func mapping(map: XMLMap) {
        trains <- map["objTrainMovements"]
    }
}

class TrainMovementModel: XMLMappable {
    var nodeName: String!

    var TrainCode: String?
    var TrainDate: String?
    var LocationCode: String?
    var LocationFullName: String?
    var LocationOrder: String?
    var LocationType: String?
    var TrainOrigin: String?
    var TrainDestination: String?
    var ScheduledArrival: String?
    var ScheduledDeparture: String?
    var ExpectedArrival: String?
    var ExpectedDeparture: String?
    var Arrival: String?
    var Departure: String?
    var AutoArrival: String?
    var AutoDepart: String?
    var StopType: String?

    required init(map: XMLMap) {

    }

    func mapping(map: XMLMap) {
        TrainCode <- map["TrainCode"]
        TrainDate <- map["TrainDate"]
        LocationCode <- map["LocationCode"]
        LocationFullName <- map["LocationFullName"]
        LocationOrder <- map["LocationOrder"]
        LocationType <- map["LocationType"]
        TrainOrigin <- map["TrainOrigin"]
        TrainDestination <- map["TrainDestination"]
        ScheduledArrival <- map["ScheduledArrival"]
        ScheduledDeparture <- map["ScheduledDeparture"]
        ExpectedArrival <- map["ExpectedArrival"]
        ExpectedDeparture <- map["ExpectedDeparture"]
        Arrival <- map["Arrival"]
        Departure <- map["Departure"]
        AutoArrival <- map["AutoArrival"]
        AutoDepart <- map["AutoDepart"]
        StopType <- map["StopType"]
    }
}
