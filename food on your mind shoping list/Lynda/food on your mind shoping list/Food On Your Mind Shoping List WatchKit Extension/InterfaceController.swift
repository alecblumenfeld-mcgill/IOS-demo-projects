//
//  InterfaceController.swift
//  Food On Your Mind Shoping List WatchKit Extension
//
//  Created by alec on 6/24/15.
//  Copyright (c) 2015 alec. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet weak var allTable: WKInterfaceTable!
    
    
    var recipieModel =  recipieList()
    var allIngredients = recipieList().getAllIngredients()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        //initalize list
        //initilize catagory list
        // Configure interface objects here.
        self.allTable.setNumberOfRows(allIngredients.count, withRowType: "allRow")
        
        for row in 0..<self.allTable.numberOfRows{
            let currentRow = self.allTable.rowControllerAtIndex(row) as! ingredientWatchCell
            currentRow.name.setText(allIngredients[row].name)
            currentRow.amount.setText(allIngredients[row].amount)
        }

    }

    override func table(table: WKInterfaceTable, didSelectRowAtIndex row: Int) {
        let currentRow = self.allTable.rowControllerAtIndex(row) as! ingredientWatchCell

        recipieModel.remove(allIngredients[row].name, cellAmount: allIngredients[row].amount)
        allIngredients = recipieList().getAllIngredients()


        
        
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
