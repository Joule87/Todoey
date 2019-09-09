//
//  ViewController.swift
//  Todoey
//
//  Created by Julio Collado on 9/9/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Fined Mike", "Buy Eggos", "Destory Demogorgon"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK:- Table View Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK:- Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("\(itemArray[indexPath.row])")
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
             tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
             tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
       
    }
    
    //MARK:- Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textFieldValue: UITextField?
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Create new Item"
            textFieldValue = textField
        }
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let item = textFieldValue?.text ?? ""
            self.addItemToTodoList(item)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    func addItemToTodoList(_ item: String) {
        itemArray.append(item)
        tableView.reloadData()
    }
    
    

}

