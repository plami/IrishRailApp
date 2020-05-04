//
//  StationModel.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import Foundation
import XMLMapper

class AllStationsModel: XMLMappable {
    var nodeName: String!

    var stations: [StationModel]?
    
    required init?(map: XMLMap) {}

    func mapping(map: XMLMap) {
        stations <- map["objStation"]
    }
}

class StationModel: XMLMappable {
    var nodeName: String!

    var StationDesc: String?
    var StationAlias: String?
    var StationLatitude: String?
    var StationLongitude: String?
    var StationCode: String?
    var StationId: String?

    required init(map: XMLMap) {

    }

    func mapping(map: XMLMap) {
        StationDesc <- map["StationDesc"]
        StationAlias <- map["StationAlias"]
        StationLatitude <- map["StationLatitude"]
        StationLongitude <- map["StationLongitude"]
        StationCode <- map["StationCode"]
        StationId <- map["StationId"]
    }
}
