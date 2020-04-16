//
//  Products+CoreDataProperties.swift
//  FoodCoordinator
//
//  Created by Bruh on 16.04.20.
//  Copyright © 2020 VSU. All rights reserved.
//
//

import Foundation
import CoreData


extension Products {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Products> {
        return NSFetchRequest<Products>(entityName: "Products")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var title: String?

}
