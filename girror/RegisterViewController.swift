//
//  RegisterViewController.swift
//  girror
//
//  Created by victor augusteo on 25/10/2014.
//  Copyright (c) 2014 Savium Studios. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var dobField: UITextField!
    
    
    var userModel = UserModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dobField.delegate = self
        // Do any additional setup after loading the view.
    }
    
//    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
//        if textField == dobField{
//            var datePickerView  : UIDatePicker = UIDatePicker()
//            datePickerView.datePickerMode = UIDatePickerMode.Date
//            dobField.inputView = datePickerView
//            datePickerView.addTarget(self, action: "handleDatePicker:", forControlEvents: UIControlEvents.ValueChanged)
//        }
//        
//        func handleDatePicker(sender: UIDatePicker) {
//            println("datepicker")
//            var dateFormatter = NSDateFormatter()
//            dateFormatter.dateFormat = "dd MMM yyyy"
//            dobField.text = dateFormatter.stringFromDate(sender.date)
//        }
//        
//        return true
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parseNewUser() {
        var user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user.email = emailField.text
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool!, error: NSError!) -> Void in
            if error == nil {
                self.pushPgsi()
                self.view.window?.rootViewController?.dismissViewControllerAnimated(true, completion: nil)
            } else {
                let errorInfo = error.userInfo!
                println("\(errorInfo)")
                // Show the errorString somewhere and let the user try again.
            }
        }
    }
    
    func pushPgsi() {
        var parsePgsi = PFObject(className: "Pgsi")
        parsePgsi["gamble_freq"] = userModel.gamble_freq
        parsePgsi["spend_avg"] = userModel.spend_avg
        parsePgsi["gambling_type"] = userModel.gambling_type
        parsePgsi["a4"] = userModel.a4
        parsePgsi["b4"] = userModel.b4
        parsePgsi["c4"] = userModel.c4
        parsePgsi["d4"] = userModel.d4
        parsePgsi["e4"] = userModel.e4
        parsePgsi["f4"] = userModel.f4
        parsePgsi["g4"] = userModel.g4
        parsePgsi["h4"] = userModel.h4
        parsePgsi["i4"] = userModel.i4
        parsePgsi["user"] = PFUser.currentUser()
        parsePgsi.saveInBackgroundWithBlock { (yesno: Bool, error: NSError!) -> Void in
            if (error == nil) {
                println("parsePgsi saved")
            }
            
        }
    }
    
    @IBAction func registerButtonPressed(sender: AnyObject) {
        parseNewUser()
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
