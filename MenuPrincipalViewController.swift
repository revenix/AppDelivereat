//
//  MenuPrincipalViewController.swift
//  AppDelivereat
//
//  Created by Mac on 3/07/18.
//  Copyright © 2018 MoisesDev. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class MenuPrincipalViewController: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
    
   
    
    var listado = [[String : AnyObject]]()
    
    
    let products = ["foto 1","foto 2","foto 3","foto 4"]
    let productsImages : [UIImage] = [UIImage(named: "ic_pedido")!,
                                      UIImage(named: "ic_pedido")!,
                                      UIImage(named: "ic_pedido")!,
                                      UIImage(named: "ic_pedido")!
                                      ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CollectionView.dataSource = self
        CollectionView.delegate = self
        
        btnMenuButton.target = revealViewController()
        btnMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.data()
        
        
        
    }

    func data(){
        //llamada al rest
        let url = "https://fakebucks.azurewebsites.net/api/products/all"
        
        request(url).validate().responseJSON{(response) in
            if((response.result.value) != nil){
                let jsondata = JSON(response.result.value!)
                print(jsondata)
                if let da = jsondata["result"].arrayObject{
                    self.listado = da as! [[String:AnyObject]]
                    
                }
                if self.listado.count > 0 {
                    self.CollectionView.reloadData()
                    
                }
                
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listado.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "Celda", for: indexPath) as! ProductsCVCell
        let lista = listado[indexPath.row]
        
        
        celda.txtNombre.text = lista["nombre"] as? String
        
        celda.txtPrecio.text =  lista["precio"] as? String
        let img = lista["imagen"] as? String
        
        let imgURL = URL(string: img! )
        celda.imgProduct.af_setImage(withURL: imgURL!)
            
        
        
        return celda
    }

}
