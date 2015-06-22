//
//  ViewController.swift
//  TableDemo
//
//  Created by Alec on 6/19/15.
//  Copyright (c) 2015 alec. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
   
    var showAll = true
    
    @IBOutlet var listSelector: [UISegmentedControl]!
    
    @IBOutlet weak var tableView: UITableView!
   
    
    var list =  recipieList()
    var typesList = recipieList().getAllTypes()
    
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            typesList = list.getAllTypes()
        case 1:
            typesList = list.getUncheckedTypes()
        default:
            typesList = list.getAllTypes()
        }
        self.tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return typesList.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(typesList.values)[section].count
       
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(typesList.keys)[section]
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        let ingredient = Array(typesList.values)[indexPath.section][indexPath.row]
        cell.textLabel!.text = ingredient.name
        cell.detailTextLabel?.text = ingredient.amount
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
       
        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell?;
        let cellName = (currentCell!.textLabel!.text)
        let cellAmount = (currentCell!.detailTextLabel!.text)
        list.toggle(cellName! , cellAmount: cellAmount!)

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

