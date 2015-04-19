//
//  DVD.swift
//  What's On?
//
//  Created by Aaron Kenyon on 4/12/15.
//  Copyright (c) 2015 Makken. All rights reserved.
//

import Foundation
import UIKit

class DVD: NSObject {
    var nameDVD:String
    
    init(nameDVD:String) {
        self.nameDVD = nameDVD
        super.init()
    }
}