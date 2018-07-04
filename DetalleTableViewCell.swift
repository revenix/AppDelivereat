//
//  DetalleTableViewCell.swift
//  AppDelivereat
//
//  Created by Mac on 4/07/18.
//  Copyright © 2018 MoisesDev. All rights reserved.
//

import UIKit

class DetalleTableViewCell: UITableViewCell {

  
    @IBOutlet weak var txtNombre: UILabel!
   
    @IBOutlet weak var txtDescripcion: UILabel!
    
    @IBOutlet weak var txtPrecio: UILabel!
    
    @IBOutlet weak var txtCantidad: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    
    
}
