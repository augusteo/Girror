//
//  SurveyHowViewController.swift
//  girror
//
//  Created by victor augusteo on 25/10/2014.
//  Copyright (c) 2014 Savium Studios. All rights reserved.
//

import UIKit

class SurveyHowViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var happySlider: UISlider!
    @IBOutlet weak var frusSlider: UISlider!
    @IBOutlet weak var alertSlider: UISlider!
    @IBOutlet weak var enthusSlider: UISlider!
    @IBOutlet weak var nervousSlider: UISlider!
    
    var recordingModel = RecordingModel()
    var quizModel = QuizModel()
    var locationManager:CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PFGeoPoint.geoPointForCurrentLocationInBackground { (geoPoint:PFGeoPoint!, error:NSError!) -> Void in
            if error == nil {
                self.quizModel.location = geoPoint
                println("\(geoPoint.latitude) and \(geoPoint.longitude)")
            } else {
                println("error")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    @IBAction func continueButtonPressed(sender: AnyObject) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
