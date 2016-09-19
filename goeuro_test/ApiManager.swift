//
//  ApiManager.swift
//  goeuro_test
//
//  Created by abdul_karim on 27/08/16.
//  Copyright © 2016 dh-labs. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {
    static let sharedInstance = APIManager()
    
    //Get Flight
    func getFlights(completionHandler: (Result<[FlightModel], NSError>) -> Void) {
        Alamofire.request(Router.GetFlights())
            .responseArray { (response:Response<[FlightModel], NSError>) in
                completionHandler(response.result)
                //print(response)
        }
    }
    
    //Get Trains
    func getTrains(completionHandler: (Result<[TrainModel], NSError>) -> Void) {
        Alamofire.request(Router.GetTrains())
            .responseArray { (response:Response<[TrainModel], NSError>) in
                completionHandler(response.result)
                //print(response)
        }
    }
    
    //Get Buses
    func getBuses(completionHandler: (Result<[BusesModel], NSError>) -> Void) {
        Alamofire.request(Router.GetBuses())
            .responseArray { (response:Response<[BusesModel], NSError>) in
                completionHandler(response.result)
                //print(response)
        }
    }
}