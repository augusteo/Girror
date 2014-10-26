//
//  QuestionaireViewController.swift
//  girror
//
//  Created by victor augusteo on 26/10/2014.
//  Copyright (c) 2014 Savium Studios. All rights reserved.
//

import UIKit

class QuestionaireViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var averagePicker: UIPickerView!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var typePicker: UIPickerView!
    
    let averageArray:[String] = ["Daily", "Weekly", "Every couple of weeks", "Monthly", "Less than monthly", "None"]
    let typeArray:[String] = ["Poker machines or electronic gaming machines", "Horse or greyhound races (excluding sweeps)", "Instant scratch tickets", "Lotteries", "Keno", "Casino table games", "Bingo", "Sporting events or other events", "Informal private games", "Day trading", "Other"]
    
    var whatAverage:Int = 0
    var whatType:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        averagePicker.delegate = self
        averagePicker.dataSource = self
        
        typePicker.delegate = self
        typePicker.dataSource = self
        
        amountField.delegate = self
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        amountField.resignFirstResponder()
        return true
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == averagePicker {
            return averageArray.count
        }
        if pickerView == typePicker {
            return typeArray.count
        } else {
            return 1
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if pickerView == averagePicker {
            return averageArray[row]
        }
        if pickerView == typePicker {
            return typeArray[row]
        } else {
            return ""
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == averagePicker {
            whatAverage = row
        }
        if pickerView == typePicker {
            whatType = row
        }
    }
    

}
