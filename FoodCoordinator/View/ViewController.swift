//
//  ViewController.swift
//  FoodCoordinator
//
//  Created by Bruh on 16.04.20.
//  Copyright © 2020 VSU. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, ViewControllerDelegate, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private let presenter = MainPresenter(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    
    var products = [Products]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setViewDelegate(viewControllerDelegate: self)
        presenter.loadProducts()
    }
    
    
    //MARK: Table View Datasource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = product.title
        cell.accessoryType = product.completed ? .checkmark : .none
        return cell
    }
    
    
    //MARK: Table View Delegate Methods
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        presenter.selectProduct(position: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.deleteProduct(product: products[indexPath.row], position: indexPath.row)
        }
    }

    @IBAction func addProductButtonHandler(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(
            title: "Добавить продукт",
            message: "Введите название продукта",
            preferredStyle: .alert
        )
        
        let addAction = UIAlertAction(title: "Сохранить", style: .default) { (addAction) in
            self.saveProductAction(alert: addAction, textField: textField)
        }
        
        let cancelAction = UIAlertAction(
            title: "Отмена",
            style: .cancel,
            handler: nil
        )
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Добавить новый продукт"
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    func saveProductAction(alert: UIAlertAction!, textField: UITextField) {
        presenter.addProduct(title: textField.text!)
    }
    
    func displayProducts(products: [Products]) {
        self.products = products
        tableView.reloadData()
    }
}

