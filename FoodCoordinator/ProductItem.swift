//
//  ProductItem.swift
//  FoodCoordinator
//
//  Created by Bruh on 16.04.20.
//  Copyright © 2020 VSU. All rights reserved.
//

import Foundation
import CoreData

public class Product: NSManagedObject {
    @NSManaged public var title: String?
}

extension Product {
    
    public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "ProductItem")
    }
}
