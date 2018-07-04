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
    
    var id:String = ""
    
    var listado = [[String : AnyObject]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        costumizeNavBar()
        
       
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
               // print(jsondata)
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
        id = lista["_id"] as! String
        celda.txtNombre.text = lista["nombre"] as? String
        celda.txtPrecio.text =  lista["precio"] as? String
        let img = lista["imagen"] as? String
        let imgURL = URL(string: img! )
        celda.imgProduct.af_setImage(withURL: imgURL!)
        return celda
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detalle = segue.destination as! DetalleProductoViewController
        detalle.id_producto = id
        //performSegue(withIdentifier: "segueDetalle", sender: self)
        
    }
    
    func costumizeNavBar(){
        
        navigationController?.navigationBar.tintColor = UIColor(displayP3Red: 193/255, green:     151/255, blue: 94/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 30/255, green: 32/255, blue: 39/255, alpha: 1)
        
        
        let navController = navigationController!
        
        let image = UIImage(named: "ic_logo_cabecera.png") //Your logo url here
        let imageView = UIImageView(image: image)
        /*
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        
        let bannerX = bannerWidth / 2 - (image?.size.width)! / 2
        let bannerY = bannerHeight / 2 - (image?.size.height)! / 2
 
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)*/
        imageView.contentMode = .scaleToFill
        
        navigationItem.titleView = imageView
    }

}
