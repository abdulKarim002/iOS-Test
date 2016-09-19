//
//  BusesCell.swift
//  goeuro_test
//
//  Created by abdul_karim on 27/08/16.
//  Copyright © 2016 dh-labs. All rights reserved.
//

import UIKit

class BusesCell: UITableViewCell {
    @IBOutlet weak var b_imageView: UIImageView!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var stops: UILabel!
    @IBOutlet weak var totDuration: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    var Buses: BusesModel!
    
    
    func configureCell(_Buses : BusesModel)  {
        self.Buses = _Buses
        let imag = Buses.providerLogo?.stringByReplacingOccurrencesOfString("{size}", withString: "63")
        b_imageView.kf_setImageWithURL(NSURL(string: imag!)!, placeholderImage: UIImage(named: "placeholder"))
        
        startTime.text = Buses.departure_time
        endTime.text = Buses.arrival_time
        stops.text = "\(Buses.numberOfStops!)"
        price.text = "\(Buses.price!)"
        
    }
}
