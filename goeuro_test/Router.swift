//
//  Router.swift
//  goeuro_test
//
//  Created by abdul_karim on 27/08/16.
//  Copyright © 2016 dh-labs. All rights reserved.
//


import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    static let baseURLString:String = "https://api.myjson.com/bins"
    
    case GetFlights() // GET https://api.myjson.com/bins/w60i
    case GetTrains() //  GET https://api.myjson.com/bins/3zmcy
    case GetBuses() //   GET https://api.myjson.com/bins/37yzm
    
    var URLRequest: NSMutableURLRequest {
        var method: Alamofire.Method {
            switch self {
            case .GetFlights:
                return .GET
            case .GetTrains():
                return .GET
            case .GetBuses():
                return .GET
            }

        }
        
        let result: (path: String, parameters: [String: AnyObject]?) = {
            switch self {
            case .GetFlights:
                return ("/w60i", nil)
            case .GetTrains:
                return ("/3zmcy", nil)
            case .GetBuses:
                return ("/37yzm", nil)
            }
        }()
        
        let URL = NSURL(string: Router.baseURLString)!
        let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(result.path))
        print(NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(result.path)))
        print(result.path)
        let encoding = Alamofire.ParameterEncoding.JSON
        let (encodedRequest, _) = encoding.encode(URLRequest, parameters: result.parameters)
        encodedRequest.HTTPMethod = method.rawValue
        return encodedRequest
    }
}