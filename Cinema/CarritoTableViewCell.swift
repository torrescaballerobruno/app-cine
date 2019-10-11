//
//  CarritoTableViewCell.swift
//  Cinema
//
//  Created by Bruno Torres on 10/10/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import UIKit

class CarritoTableViewCell: UITableViewCell {

    @IBOutlet weak var cantidad: UILabel!
    @IBOutlet weak var articulo: UILabel!
    @IBOutlet weak var precio: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
