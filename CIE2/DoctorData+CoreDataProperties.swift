//
//  DoctorData+CoreDataProperties.swift
//  CIE2
//
//  Created by bmiit on 15/04/24.
//
//

import Foundation
import CoreData


extension DoctorData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DoctorData> {
        return NSFetchRequest<DoctorData>(entityName: "DoctorData")
    }

    @NSManaged public var dname: String?
    @NSManaged public var dtype: String?

}

extension DoctorData : Identifiable {

}
