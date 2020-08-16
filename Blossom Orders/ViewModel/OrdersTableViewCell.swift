//
//  OrdersTableViewCell.swift
//  Blossom Orders
//
//  Created by Adina Chiriliuc on 16/08/2020.
//  Copyright © 2020 Adina Chiriliuc. All rights reserved.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel:UILabel!
        
    @IBOutlet weak var nameLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
