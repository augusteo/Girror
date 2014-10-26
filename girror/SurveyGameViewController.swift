//
//  SurveyGameViewController.swift
//  girror
//
//  Created by victor augusteo on 25/10/2014.
//  Copyright (c) 2014 Savium Studios. All rights reserved.
//

import UIKit

class SurveyGameViewController: UIViewController {

    @IBOutlet weak var doneLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var gameButton1: UIButton!
    @IBOutlet weak var gameButton2: UIButton!
    @IBOutlet weak var gameButton3: UIButton!
    @IBOutlet weak var gameButton4: UIButton!
    @IBOutlet weak var gameButton5: UIButton!
    @IBOutlet weak var gameButton6: UIButton!
    @IBOutlet weak var gameButton7: UIButton!
    @IBOutlet weak var gameButton8: UIButton!
    @IBOutlet weak var gameButton9: UIButton!
    @IBOutlet weak var instrucLabel: UILabel!
    
    var gameStartTime:NSDate = NSDate()
    var gameDoneTime:NSDate = NSDate()
    var gameReactionTime:[Double] = [213.0, 421.0, 532.2, 123.3, 352.4, 546.5, 123.1, 213.2]
    
    var redButton:Int = 0
    var gameCount:Int = 0
    
    var recordingModel = RecordingModel()
    var quizModel = QuizModel()
    
    var parseRecording = PFObject(className: "Recording")
    var parseQuiz = PFObject(className: "Quiz")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        gameButton1.hidden = true
        gameButton2.hidden = true
        gameButton3.hidden = true
        gameButton4.hidden = true
        gameButton5.hidden = true
        gameButton6.hidden = true
        gameButton7.hidden = true
        gameButton8.hidden = true
        gameButton9.hidden = true
        
        
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        recordingModel.responseTimes = gameReactionTime
        saveParseObject()
    }

    @IBAction func startButtonPressed(sender: AnyObject) {
        startButton.hidden = true
        instrucLabel.hidden = true
        
        gameButton1.hidden = false
        gameButton2.hidden = false
        gameButton3.hidden = false
        gameButton4.hidden = false
        gameButton5.hidden = false
        gameButton6.hidden = false
        gameButton7.hidden = false
        gameButton8.hidden = false
        gameButton9.hidden = false
        randomizeButton()
    }
    
    func randomizeButton() {
        resetButtonColor()
        if gameCount <= 8 {
            redButton = Int(arc4random_uniform(9))
            switch redButton {
            case 0:
                gameButton1.backgroundColor = UIColor.redColor()
            case 1:
                gameButton2.backgroundColor = UIColor.redColor()
            case 2:
                gameButton3.backgroundColor = UIColor.redColor()
            case 3:
                gameButton4.backgroundColor = UIColor.redColor()
            case 4:
                gameButton5.backgroundColor = UIColor.redColor()
            case 5:
                gameButton6.backgroundColor = UIColor.redColor()
            case 6:
                gameButton7.backgroundColor = UIColor.redColor()
            case 7:
                gameButton8.backgroundColor = UIColor.redColor()
            case 8:
                gameButton9.backgroundColor = UIColor.redColor()
            default:
                break
            }
            
            self.gameStartTime = NSDate()
            self.gameCount++
        } else {
            gameButton1.hidden = true
            gameButton2.hidden = true
            gameButton3.hidden = true
            gameButton4.hidden = true
            gameButton5.hidden = true
            gameButton6.hidden = true
            gameButton7.hidden = true
            gameButton8.hidden = true
            gameButton9.hidden = true
            doneButton.hidden = false
            doneLabel.hidden = false
        }
    }
    
    func resetButtonColor() {
        gameButton1.backgroundColor = UIColor.grayColor()
        gameButton2.backgroundColor = UIColor.grayColor()
        gameButton3.backgroundColor = UIColor.grayColor()
        gameButton4.backgroundColor = UIColor.grayColor()
        gameButton5.backgroundColor = UIColor.grayColor()
        gameButton6.backgroundColor = UIColor.grayColor()
        gameButton7.backgroundColor = UIColor.grayColor()
        gameButton8.backgroundColor = UIColor.grayColor()
        gameButton9.backgroundColor = UIColor.grayColor()
    }
    
    func measureTime() {
        var interval:Double = self.gameStartTime.timeIntervalSinceNow * -1000
        var index = self.gameCount - 2
        if interval < 100 {
            self.gameReactionTime[index] = interval
        }

    }
    
    @IBAction func gameButton1Pressed(sender: AnyObject) {
        if redButton == 0 {
            randomizeButton()
            measureTime()
        }
    }
    
    @IBAction func gameButton2Pressed(sender: AnyObject) {
        if redButton == 1 {
            randomizeButton()
            measureTime()
        }
    }
    
    @IBAction func gameButton3Pressed(sender: AnyObject) {
        if redButton == 2 {
            randomizeButton()
            measureTime()
        }
    }
    
    @IBAction func gameButton4Pressed(sender: AnyObject) {
        if redButton == 3 {
            randomizeButton()
            measureTime()
        }
    }
    
    @IBAction func gameButton5Pressed(sender: AnyObject) {
        if redButton == 4 {
            randomizeButton()
            measureTime()
        }
    }
    
    @IBAction func gameButton6Pressed(sender: AnyObject) {
        if redButton == 5 {
            randomizeButton()
            measureTime()
        }
    }
    
    @IBAction func gameButton7Pressed(sender: AnyObject) {
        if redButton == 6 {
            randomizeButton()
            measureTime()
        }
    }
    
    @IBAction func gameButton8Pressed(sender: AnyObject) {
        if redButton == 7 {
            randomizeButton()
            measureTime()
        }
    }
    
    @IBAction func gameButton9Pressed(sender: AnyObject) {
        if redButton == 8 {
            randomizeButton()
            measureTime()            
        }
    }
    
    func saveParseObject() {
        
        //Setting parse quiz

        parseQuiz["start_time"] = quizModel.startTime
        
        let now = NSDate()
        if (now.timeIntervalSinceDate(quizModel.startTime) > 900) {
            quizModel.validResponseTime = false
        } else {
            quizModel.validResponseTime = true
        }
        parseQuiz["valid_response_time"] = quizModel.validResponseTime
        parseQuiz["user"] = PFUser.currentUser()
        PFGeoPoint.geoPointForCurrentLocationInBackground({ (geoPoint:PFGeoPoint!, error:NSError!) -> Void in
            if error == nil {
                self.parseQuiz["location"] = geoPoint
                self.parseQuiz.saveInBackgroundWithBlock { (yesno: Bool, error: NSError!) -> Void in
                    if (error == nil) {
                        println("parseQuiz saved")
                    }

                }
                println(geoPoint.latitude)
                println(geoPoint.longitude)
            } else {
                println(error.userInfo)
            }
        })
        
        //Recording parse recording

        parseRecording["happy_score"] = Int(recordingModel.happyScore)
        parseRecording["frustrated_score"] = Int(recordingModel.frustratedScore)
        parseRecording["alert_score"] = Int(recordingModel.alertScore)
        parseRecording["enthusiasm_score"] = Int(recordingModel.enthusiasmScore)
        parseRecording["nervous_score"] = Int(recordingModel.nervousScore)
        parseRecording["response_times"] = recordingModel.responseTimes
        parseRecording["alcohol"] = recordingModel.alcohol
        parseRecording["what_doing"] = recordingModel.whatDoing
        parseRecording["other"] = recordingModel.withOther
        parseRecording["friends"] = recordingModel.withFriends
        parseRecording["colleagues"] = recordingModel.withColleagues
        parseRecording["other_family"] = recordingModel.withFamily
        parseRecording["children"] = recordingModel.withChildren
        parseRecording["partner"] = recordingModel.withPartner
        parseRecording["alone"] = recordingModel.withAlone
        parseRecording["quiz"] = parseQuiz


        
        parseRecording.saveInBackgroundWithBlock { (yesno: Bool, error: NSError!) -> Void in
            if (error == nil) {
                println("parseRecording saved")
            }
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
