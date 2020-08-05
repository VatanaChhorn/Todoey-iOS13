//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = ["Data1", "Deta2",  "Data3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Data Source
    
    //To generate the number of row in the TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
        
    }
    
    //Initialize each of the cells with a function, or value.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // dequeueReusableCell Returns a reusable table-view cell object for the specified reuse identifier and adds it to the table.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCells", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    //Tells the delegate that the specified row is now selected.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        //Deselects a given row identified by index path, with an option to animate the deselection.
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        //CellForRow: Returns the table cell at the specified index path.
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    
    //MARK: - add new item
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        
        var alertText = UITextField()
        
        //MARK: - Alert
        
        //An object that displays an alert message to the user.
        let alert = UIAlertController(title: "Add new todoey items", message: "", preferredStyle: .alert)
        
        //An action that can be taken when the user taps a button in an alert.
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the add Item Button on our UIAlert
            print("success!")
            print(alertText.text!)
            
            if alertText.text != "" {
            self.itemArray.append(alertText.text ?? "New Item")
            }
            
            //Reloads the rows and sections of the table view.
            self.tableView.reloadData()
        }
        
        //Adds a text field to an alert.
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Insert new item"
            alertText = alertTextField
            
        }
        
        //Attaches an action object to the alert or action sheet.
        alert.addAction(action)
        
        //Presents a view controller modally.
        present(alert, animated: true, completion: nil)
        
    }
    
}
