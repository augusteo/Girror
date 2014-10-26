//
//  QuizModel.swift
//  girror
//
//  Created by victor augusteo on 25/10/2014.
//  Copyright (c) 2014 Savium Studios. All rights reserved.
//

import Foundation

class QuizModel:NSObject {
    var startTime:NSDate = NSDate()
    var validResponseTime:Bool = true
    var user:PFUser = PFUser.currentUser()
    var location:PFGeoPoint = PFGeoPoint(latitude: -37.813611, longitude: 144.963056)
}