//
//  Constants.swift
//  IrishRailApp
//
//  Created by Plamena Nikolova on 1.05.20.
//  Copyright © 2020 plamena. All rights reserved.
//

import UIKit

struct Constants {
    enum Colors {
        static let main = "#00539F"
    }
    
    enum stationAndTrainTypes {
        static let All = "All"
        static let Mainline = "Mainline"
        static let Suburban = "Suburban"
        static let Dart = "Dart"
    }
    
    enum stationAndTrainNetworking {
        static let All = "A"
        static let Mainline = "M"
        static let Suburban = "S"
        static let Dart = "D"
    }
    
    enum strings {
        static let Ok = "OK"
        static let Filter = "FILTER"
        static let Back = "Back"
        static let Cancel = "CANCEL"
        static let FilterStations = "Filter stations by: "
        static let FilterTrains = "Filter trains by: "
        static let Done = "Done"
    }
}

struct AppConfiguration {
    static let urlAllStations = "http://api.irishrail.ie/realtime/realtime.asmx/getAllStationsXML"
    static let urlAllStationsByType = "http://api.irishrail.ie/realtime/realtime.asmx/getAllStationsXML_WithStationType?StationType="
    static let urlCurrentTrains = "http://api.irishrail.ie/realtime/realtime.asmx/getCurrentTrainsXML"
    static let urlTrainsByType = "http://api.irishrail.ie/realtime/realtime.asmx/getCurrentTrainsXML_WithTrainType?TrainType="
    static let urlTrainsMovements = "http://api.irishrail.ie/realtime/realtime.asmx/getTrainMovementsXML?TrainId="

}
