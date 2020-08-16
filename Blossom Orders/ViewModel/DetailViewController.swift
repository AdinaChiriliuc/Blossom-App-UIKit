//
//  DetailViewController.swift
//  Blossom Orders
//
//  Created by Adina Chiriliuc on 16/08/2020.
//  Copyright © 2020 Adina Chiriliuc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var customerIdLabel: UILabel!
    @IBOutlet weak var customerNameLabel: UILabel!
    @IBOutlet weak var customerAddressLabel: UILabel!
    @IBOutlet weak var descriptionNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var order: OrdersData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customerIdLabel.text = order?.customer_id
        customerNameLabel.text = order?.customer_name
        customerAddressLabel.text = order?.customer_address
        descriptionNameLabel.text = order?.description_name
        priceLabel.text = order?.price
    }
    

}
