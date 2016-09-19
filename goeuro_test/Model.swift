
//
//  FlightModel.swift
//  goeuro_test
//
//  Created by abdul karim on 27/08/16.
//  Copyright © 2016 dh-labs. All rights reserved.
//

import Foundation
import SwiftyJSON

class FlightModel: ResponseJSONObjectSerializable {
    
    var flightID: String?
    var providerLogo: String?
    var price: String?
    var departure_time: String?
    var arrival_time: String?
    var numberOfStops: Int?
    
    required init (json: JSON) {
        self.flightID = json["id"].string
        self.providerLogo = json["provider_logo"].string
        self.price = json["price_in_euros"].string
        self.departure_time = json["departure_time"].string
        self.arrival_time = json["arrival_time"].string
        self.numberOfStops = json["number_of_stops"].int
        }
    }
    

class TrainModel: ResponseJSONObjectSerializable {
    
    var TrainID: String?
    var providerLogo: String?
    var price: Float?
    var departure_time: String?
    var arrival_time: String?
    var numberOfStops: Int?
    
    required init (json: JSON) {
        self.TrainID = json["id"].string
        self.providerLogo = json["provider_logo"].string
        self.price = json["price_in_euros"].float
        self.departure_time = json["departure_time"].string
        self.arrival_time = json["arrival_time"].string
        self.numberOfStops = json["number_of_stops"].int
    }
    
    required init() {
        
    }
}


class BusesModel: ResponseJSONObjectSerializable {
    
    var BusesID: String?
    var providerLogo: String?
    var price: Float?
    var departure_time: String?
    var arrival_time: String?
    var numberOfStops: Int?
    
    required init (json: JSON) {
        self.BusesID = json["id"].string
        self.providerLogo = json["provider_logo"].string
        self.price = json["price_in_euros"].float
        self.departure_time = json["departure_time"].string
        self.arrival_time = json["arrival_time"].string
        self.numberOfStops = json["number_of_stops"].int
    }
    
    required init() {
        
    }
}