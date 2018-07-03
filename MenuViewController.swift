//
//  MenuViewController.swift
//  AppDelivereat
//
//  Created by Mac on 3/07/18.
//  Copyright © 2018 MoisesDev. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController , UITableViewDelegate,UITableViewDataSource{
    
    
    var menuNameArr:Array = [String]()
    var menuImgArr:Array = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuNameArr = ["Pedidos","Inicio" ,"Cerrar Sesion"]
        menuImgArr = [UIImage(named: "ic_pedido")!,UIImage(named: "ic_selec")!,UIImage(named: "ic_selec")!]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        cell.lblImageIcon.image = menuImgArr[indexPath.row]
        cell.lblTextIcon.text! = menuNameArr[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealViewController:SWRevealViewController = self.revealViewController()
        let cell:MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
        if(cell.lblTextIcon.text! == "Pedidos"){
            let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let descontroller = mainStoryBoard.instantiateViewController(withIdentifier: "PedidoViewController") as! PedidoViewController
            let newfrontViewController = UINavigationController.init(rootViewController:descontroller)
            revealViewController.pushFrontViewController(newfrontViewController, animated: true)
            
        }
        if(cell.lblTextIcon.text! == "Inicio"){
            let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let descontroller = mainStoryBoard.instantiateViewController(withIdentifier: "MenuPrincipalViewController") as! MenuPrincipalViewController
            let newfrontViewController = UINavigationController.init(rootViewController:descontroller)
            revealViewController.pushFrontViewController(newfrontViewController, animated: true)
            
        }
        if(cell.lblTextIcon.text! == "Cerrar Sesion"){
            
        }
    }
}
