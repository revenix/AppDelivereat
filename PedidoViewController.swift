//
//  PedidoViewController.swift
//  AppDelivereat
//
//  Created by Mac on 3/07/18.
//  Copyright © 2018 MoisesDev. All rights reserved.
//

import UIKit

class PedidoViewController: UIViewController {

    @IBOutlet weak var btMenu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btMenu.target = revealViewController()
        btMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        costumizeNavBar()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func costumizeNavBar(){
        
        navigationController?.navigationBar.tintColor = UIColor(displayP3Red: 193/255, green:     151/255, blue: 94/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 30/255, green: 32/255, blue: 39/255, alpha: 1)
        
        
        let navController = navigationController!
        
        let image = UIImage(named: "ic_logo_cabecera.png") //Your logo url here
        let imageView = UIImageView(image: image)
        
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        
        let bannerX = bannerWidth / 1 - (image?.size.width)! / 1
        let bannerY = bannerHeight / 1 - (image?.size.height)! / 1
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
