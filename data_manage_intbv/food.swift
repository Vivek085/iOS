//
//  food.swift
//  data_manage_intbv
//
//  Created by bmiit on 05/03/24.
//

import Foundation
class food{
    var foodID:Int = 0;
    var foodname:String = "";
    var fprice:Double = 0.0;
    init(id: Int, name: String, price: Double) {
        foodID = id
        foodname = name
        fprice = price
    }

    func edit(id: Int, name: String, price: Double){
        foodID = id
        foodname = name
        fprice = price
    }
    
}
