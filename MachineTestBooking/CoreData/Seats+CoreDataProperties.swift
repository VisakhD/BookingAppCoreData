//
//  Seats+CoreDataProperties.swift
//  MachineTestBooking
//
//  Created by Visakh D on 13/05/25.
//
//

import Foundation
import CoreData


extension Seats {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Seats> {
        return NSFetchRequest<Seats>(entityName: "Seats")
    }

    @NSManaged public var availabelSeats: Int64
    @NSManaged public var bookedSeats: Int64

}

extension Seats : Identifiable {

}
