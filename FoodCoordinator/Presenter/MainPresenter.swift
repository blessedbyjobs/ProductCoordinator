//
//  MainPresenter.swift
//  FoodCoordinator
//
//  Created by Bruh on 16.04.20.
//  Copyright © 2020 VSU. All rights reserved.
//

import Foundation
import CoreData

class MainPresenter {
    private let coreDataContext: NSManagedObjectContext
    weak private var view: ViewControllerDelegate?
    
    var products = [Products]()
    
    init(context: NSManagedObjectContext) {
        coreDataContext = context
    }
    
    func setViewDelegate(viewControllerDelegate: ViewControllerDelegate?) {
        self.view = viewControllerDelegate
    }
    
    func loadProducts() {
        let request: NSFetchRequest<Products> = Products.fetchRequest()
        
        do {
            products = try coreDataContext.fetch(request)
        }
        catch {
            print("Ошибка при загрузке")
        }
        
        view?.displayProducts(products: products)
    }
    
    func addProduct(title: String) {
        let newProduct = Products(context: coreDataContext)
        newProduct.title = title
        products.append(newProduct)
        saveProducts()
        
        view?.displayProducts(products: products)
    }
    
    func selectProduct(position: Int) {
        products[position].completed = !products[position].completed
        saveProducts()
    }
    
    func saveProducts() {
        do {
            try coreDataContext.save()
        }
        catch {
            print("Ошибка при сохранении")
        }
        
        view?.displayProducts(products: products)
    }
    
    func deleteProduct(product: Products, position: Int) {
        products.remove(at: position)
        coreDataContext.delete(product)
        
        do {
            try coreDataContext.save()
        }
        catch {
            print("Ошибка удаления")
        }
        
        view?.displayProducts(products: products)
    }
}
