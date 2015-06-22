//
//  recipe.swift
//  TableDemo
//
//  Created by Alec on 6/20/15.
//  Copyright (c) 2015 alec. All rights reserved.
//

import Foundation
//define new cell where recipie is linked in the cell value 


var potato = ingredient(Name: "potato", Amount: "1 lb", ingredientType: "vegtable")
var tomato = ingredient(Name: "tomato", Amount: "1 lb", ingredientType: "vegtable")
var corn = ingredient(Name: "corn", Amount: "4 ears ", ingredientType: "vegtable")
//meat
var chicken = ingredient(Name: "chicken", Amount: ".5 lb", ingredientType: "meat")
var beef = ingredient(Name: "beef", Amount: ".25 lb", ingredientType: "meat")
var pork  = ingredient(Name: "pork", Amount: "1 lb", ingredientType: "meat")
//fruits
var peach = ingredient(Name: "peach", Amount: "3 peaches", ingredientType: "fruit")



var cornBeef = recipie(recipieName: "Corned Beef", recipieIngredients:  [beef, corn] )

var chickenStew = recipie(recipieName: "Chicken Stew", recipieIngredients:  [chicken, tomato, potato] )

class ingredientList{
    //defualt type is sorted
    //must consider case where 2 ingrents of the same name are in list oming from
    //two diffrent recipies
    var ingredients = [String:[ingredient]]()
    
    init(){
        var ingredientsTemp =  [ingredient]()
        ingredientsTemp += (cornBeef.ingredients)
        ingredientsTemp += (chickenStew.ingredients)
        
    }
//    subscript(index: Int) -> ingredient{
//        return ingredients[index]
//    }
//    
}
class recipieList {
    var recipieList =  [recipie]()
    init () {
        self.recipieList.append(cornBeef)
        self.recipieList.append(chickenStew)
    }
    subscript(index: Int) -> recipie{
        return recipieList[index]
    }
    
    func getAllTypes()-> [String: [ingredient]] {
                var typeList = [String: [ingredient]]()
                for recipie in self.recipieList{
                    for ingredient in recipie.ingredients{
                        
                        if let val =  typeList[ingredient.type]{
                            typeList[ingredient.type]?.append(ingredient)
                        }
                        else{
                            typeList[ingredient.type as String] = [ingredient]
                        }
                        
                    }
                }
        return typeList
        }
    
    func getUncheckedTypes()-> [String: [ingredient]] {

        var typeList = [String: [ingredient]]()
            for recipie in self.recipieList{
                for ingredient in recipie.ingredients{
                    if ingredient.checked == true{
                        continue
                    }
                    if let val =  typeList[ingredient.type]{
                        typeList[ingredient.type]?.append(ingredient)
                    }
                    else{
                        typeList[ingredient.type as String] = [ingredient]
                    }
                    
                }
            }
            return typeList
        
        
        
    }
    
    func toggle(cellName: String, cellAmount : String ){
        for recipie in self.recipieList{
            for ingredient in recipie.ingredients{
                if ingredient.name == cellName && ingredient.amount == cellAmount{
                    ingredient.checked = !ingredient.checked
                    println("\(ingredient.name) is now \(ingredient.checked)")

                }
            }
        }
        
    }
    
   


}
    



class recipie {
    var name:String
    var ingredients : [ingredient] = []
    var checked :Bool = false
    init(recipieName: String , recipieIngredients:[ingredient]){
        name = recipieName
        ingredients = recipieIngredients
        for ingredient in recipieIngredients{
        ingredient.recipieName = recipieName
        }
    }
    subscript(index: Int) -> ingredient{
        return ingredients[index]
    }
    
    func removeIngredient ( index: Int ){
        //
        
    }
    
    func getLeft()-> [ingredient]{
        var toRet = [ingredient]()
        for x in self.ingredients{
            if(x.checked == false){
                toRet.append(x)
            }
        }
        return toRet
    }
    
    func getChecked() -> [ingredient]{
        var toRet = [ingredient]()
        for x in self.ingredients{
            if(x.checked == true){
                toRet.append(x)
            }
        }
        return toRet
    }
    
    
}
class ingredient{
    var name : String
    var amount : String
    var type : String
    var recipieName = ""

    var checked :Bool = false
    
    init(Name:String, Amount:String, ingredientType: String){
        name = Name
        amount = Amount
        type = ingredientType
    }
    
}