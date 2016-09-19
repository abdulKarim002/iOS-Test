//
//  FlightCell.swift
//  goeuro_test
//
//  Created by Kayoti on 27/08/16.
//  Copyright © 2016 dh-labs. All rights reserved.
//

import UIKit
import Kingfisher

class FlightCell: UITableViewCell {
    @IBOutlet weak var f_imageView: UIImageView!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var stops: UILabel!
    @IBOutlet weak var totDuration: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var Flight: FlightModel!
    
    
    func configureCell(_Flight : FlightModel)  {
        self.Flight = _Flight
        let imag = Flight.providerLogo?.stringByReplacingOccurrencesOfString("{size}", withString: "63")
        f_imageView.kf_setImageWithURL(NSURL(string: imag!)!, placeholderImage: UIImage(named: "placeholder"))
        startTime.text = Flight.departure_time
        endTime.text = Flight.arrival_time
        stops.text = "\(Flight.numberOfStops!)"
        price.text = Flight.price
        
    }
}
