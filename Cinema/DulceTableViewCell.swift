//
//  DulceTableViewCell.swift
//  Cinema
//
//  Created by Bruno Torres on 10/8/19.
//  Copyright © 2019 Bruno Torres. All rights reserved.
//

import UIKit

class DulceTableViewCell: UITableViewCell {

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var nombre: UILabel!
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
