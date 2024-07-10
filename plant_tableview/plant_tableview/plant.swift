//
//  plant.swift
//  plant_tableview
//
//  Created by bmiit on 04/03/24.
//

import Foundation

class plant{
    
    var plantId:Int = 0 ;
    var plantname:String = "";
    var price:Double = 0.0;
    
    init(id: Int, name: String, price: Double) {
        self.plantId = id
        self.plantname = name
        self.price = price
    }
}
