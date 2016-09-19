//
//  ResponseJSONObjectSerializable.swift
//  RouterTest
//
//  Created by Kayoti on 27/08/16.
//  Copyright © 2016 dh-labs. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol ResponseJSONObjectSerializable {
    init?(json: SwiftyJSON.JSON)
}
