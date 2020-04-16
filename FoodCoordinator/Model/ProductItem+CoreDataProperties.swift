//
//  ProductItem+CoreDataProperties.swift
//  FoodCoordinator
//
//  Created by Bruh on 16.04.20.
//  Copyright © 2020 VSU. All rights reserved.
//
//

import Foundation
import CoreData


extension ProductItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductItem> {
        return NSFetchRequest<ProductItem>(entityName: "ProductItem")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var title: String

}
