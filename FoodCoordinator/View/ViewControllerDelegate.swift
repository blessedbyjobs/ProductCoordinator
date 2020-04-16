//
//  ViewControllerDelegate.swift
//  FoodCoordinator
//
//  Created by Bruh on 16.04.20.
//  Copyright © 2020 VSU. All rights reserved.
//

import Foundation

protocol ViewControllerDelegate: NSObjectProtocol {
    func displayProducts(products: [Products])
}
