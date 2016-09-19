//
//  Buses.swift
//  goeuro_test
//
//  Created by abdul karim on 27/08/16.
//  Copyright © 2016 dh-labs. All rights reserved.
//

import UIKit
import Alamofire

class Buses: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var buses = [BusesModel]()
    @IBOutlet weak var busesTableView: UITableView!
    
    override func viewDidLoad() {
        getTrains()
    }
    
    func getTrains() {
        
        APIManager.sharedInstance.getBuses() {result in
            guard result.error == nil else {
                print (result.error)
                //display error
                return
            }
            if let fetchResult = result.value {
                self.buses = fetchResult
                //print(self.flights.count)
            }
            self.busesTableView.reloadData()
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return buses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusesCell") as! BusesCell
        
        let _bus = buses[indexPath.row]
        cell.configureCell(_bus)
        return cell
    }
}
