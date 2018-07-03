//
//  MenuPrincipalViewController.swift
//  AppDelivereat
//
//  Created by Mac on 3/07/18.
//  Copyright © 2018 MoisesDev. All rights reserved.
//

import UIKit

class MenuPrincipalViewController: UIViewController {

    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        btnMenuButton.target = revealViewController()
        btnMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 

}
