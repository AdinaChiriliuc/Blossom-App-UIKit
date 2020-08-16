//
//  OrdersTableViewController.swift
//  Blossom Orders
//
//  Created by Adina Chiriliuc on 16/08/2020.
//  Copyright © 2020 Adina Chiriliuc. All rights reserved.
//

import UIKit

class OrdersTableViewController: UITableViewController {
    
  private let ordersURL = "https://demo0510215.mockable.io/"
  private var orders = [OrdersData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 100.0
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        getLatestOrders()
       
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.order = orders[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return orders.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! OrdersTableViewCell

        cell.idLabel.text = orders[indexPath.row].customer_id
        cell.nameLabel.text = orders[indexPath.row].customer_name
        
      
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MasterToDetail", sender: self)
       
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        } else {
             tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
        cell.accessoryType = .none
        }
    }
    
    func getLatestOrders() {
        guard let ordersUrl = URL(string: ordersURL) else {
            return
}
        let request = URLRequest(url: ordersUrl)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print(error)
                return
  
    }
            // Parse JSON data
                if let data = data {
                self.orders = self.parseJsonData(data: data)
            
            // Reload table view
                    OperationQueue.main.addOperation({
                        self.tableView.reloadData()
                    })
            }
        })
        task.resume()
}

    func parseJsonData(data: Data) -> [OrdersData] {
        var orders = [OrdersData]()
        
        let decoder = JSONDecoder()
        do {
            let ordersDataStore = try decoder.decode(OrdersDataStore.self, from: data)
            orders = ordersDataStore.orders
            
        } catch {
            print(error)
        }
        return orders
    }
}
