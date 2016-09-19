//
//  TrainCell.swift
//  goeuro_test
//
//  Created by abdul_karim on 27/08/16.
//  Copyright © 2016 dh-labs. All rights reserved.
//

import UIKit
import Kingfisher

class TrainCell: UITableViewCell {
    @IBOutlet weak var t_imageView: UIImageView!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var stops: UILabel!
    @IBOutlet weak var totDuration: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var Train: TrainModel!
    
    
    func configureCell(_Train : TrainModel)  {
        self.Train = _Train
        let imag = Train.providerLogo?.stringByReplacingOccurrencesOfString("{size}", withString: "63")
        t_imageView.kf_setImageWithURL(NSURL(string: imag!)!, placeholderImage: UIImage(named: "placeholder"))
        
        startTime.text = Train.departure_time
        endTime.text = Train.arrival_time
        stops.text = "\(Train.numberOfStops!)"
        price.text = "\(Train.price!)"
        
    }

}
