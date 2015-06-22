//
//  ViewController.swift
//  PickerView
//
//  Created by Alec on 6/19/15.
//  Copyright (c) 2015 alec. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let moodArray =  ["happy","sad","some","THING","DATA"]
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return moodArray.count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return moodArray[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let result  = row % 2
        var newcolor : UIColor
        switch result{
        case  0 :
            newcolor = UIColor.yellowColor()
        default:
            newcolor = UIColor.blueColor()
        }
        self.view.backgroundColor = newcolor
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

