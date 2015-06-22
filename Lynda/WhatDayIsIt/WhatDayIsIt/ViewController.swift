//
//  ViewController.swift
//  WhatDayIsIt
//
//  Created by Alec on 6/19/15.
//  Copyright (c) 2015 alec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func displayDay(sender: AnyObject) {
        //grab the date
        var givenDate = self.datePicker.date
        
        //use date formater
        var formatter = NSDateFormatter()
        // date formater ... format (day from date)
        formatter.dateFormat = "EEEE"
        
        // get the day from the formater
        
        let day = formatter.stringFromDate(givenDate)
        let result = "That was a \(day)"
        
        //create alerart
        
        let myAlert = UIAlertController(title: result, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        //add ok button
        myAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        //present the aleart
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

