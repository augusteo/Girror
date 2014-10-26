//
//  RecordingModel.swift
//  girror
//
//  Created by victor augusteo on 25/10/2014.
//  Copyright (c) 2014 Savium Studios. All rights reserved.
//

import Foundation

class RecordingModel: NSObject {
    var happyScore:Int = 50
    var frustratedScore:Int = 50
    var alertScore:Int = 50
    var enthusiasmScore:Int = 50
    var nervousScore:Int = 50
    var responseTimes:[Double] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    var alcohol:Bool = false
    var whatDoing:String = "None"
    var withOther:Bool = false
    var withFriends:Bool = false
    var withColleagues:Bool = false
    var withFamily:Bool = false
    var withChildren:Bool = false
    var withPartner:Bool = false
    var withAlone:Bool = false
}