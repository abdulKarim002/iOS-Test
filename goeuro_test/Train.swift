//
//  Train.swift
//  goeuro_test
//
//  Created by abdul karim on 27/08/16.
//  Copyright © 2016 dh-labs. All rights reserved.
//

import UIKit
import Alamofire

class Train: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var trains = [TrainModel]()
    @IBOutlet weak var trainTableView: UITableView!
    
    override func viewDidLoad() {
        getTrains()
    }
    
    func getTrains() {
        
        APIManager.sharedInstance.getTrains() {result in
            guard result.error == nil else {
                print (result.error)
                //display error
                return
            }
            if let fetchResult = result.value {
                self.trains = fetchResult
                //print(self.flights.count)
            }
            self.trainTableView.reloadData()
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return trains.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TrainCell") as! TrainCell
        
        let _train = trains[indexPath.row]
        cell.configureCell(_train)
        return cell
    }

}
