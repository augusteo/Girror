//
//  ProfileViewController.swift
//  girror
//
//  Created by victor augusteo on 25/10/2014.
//  Copyright (c) 2014 Savium Studios. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        checkLogin()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        checkLogin()
    }
    
    func checkLogin() {
        var currentUser = PFUser.currentUser()
        var query = PFQuery(className:"Quiz")
        if currentUser != nil {
            self.userLabel.text = "Welcome \(currentUser.username)"
            query.whereKey("user", equalTo:currentUser)
            query.countObjectsInBackgroundWithBlock { (countParse: Int32, errorS: NSError!) -> Void in
                if errorS == nil {
                    self.yearLabel.text = "\(countParse)"
                    self.weekLabel.text = "\(countParse)"
                }
            }
        } else {
            //Prompt login or register
            performSegueWithIdentifier("profileToSplash", sender: self)
        }
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        println(status)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

