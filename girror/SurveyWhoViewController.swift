//
//  SurveyWhoViewController.swift
//  girror
//
//  Created by victor augusteo on 25/10/2014.
//  Copyright (c) 2014 Savium Studios. All rights reserved.
//

import UIKit

class SurveyWhoViewController: UIViewController {
    @IBOutlet weak var aloneSwitch: UISwitch!
    @IBOutlet weak var notAloneView: UIView!
    
    var recordingModel = RecordingModel()
    var quizModel = QuizModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        aloneSwitch.addTarget(self, action: "showNotAloneView", forControlEvents: .ValueChanged)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continueButtonPressed(sender: AnyObject) {
        println("WHO???")
    }
    
    func showNotAloneView() {
        if aloneSwitch.on == false{
            notAloneView.hidden = false
        } else {
            notAloneView.hidden = true
        }

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
