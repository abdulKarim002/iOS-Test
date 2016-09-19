//
//  Flight.swift
//  goeuro_test
//
//  Created by abdul karim on 27/08/16.
//  Copyright © 2016 dh-labs. All rights reserved.
//

import UIKit
import Alamofire

class Flight: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var flights = [FlightModel]()
    var fetchedURL = [AnyObject]()

    @IBOutlet weak var flightTableView: UITableView!
    
    override func viewDidLoad() {
        
        getFlights()
    }
        
    func getFlights() {
        
        APIManager.sharedInstance.getFlights() {result in
            guard result.error == nil else {
                print (result.error)
                //display error
                return
            }
            if let fetchResult = result.value {
                self.flights = fetchResult
                //print(self.flights.count)
            }
            self.flightTableView.reloadData()
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return flights.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FlightCell") as! FlightCell
        
        let _flight = flights[indexPath.row]
        cell.configureCell(_flight)

        return cell
    }

}
