//
//  DetalleProductoViewController.swift
//  AppDelivereat
//
//  Created by Mac on 4/07/18.
//  Copyright © 2018 MoisesDev. All rights reserved.
//

import UIKit
import  AlamofireImage
import  Alamofire
import SwiftyJSON

class DetalleProductoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var ImagenProducto: UIImageView!
    
    @IBOutlet weak var Table: UITableView!
    
   // var id_producto:String = "5b3508a232da3726f48d60e3"
    var id_producto:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.Table.reloadData()
        
        Table.dataSource = self
        Table.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = Table.dequeueReusableCell(withIdentifier: "celda") as! DetalleTableViewCell
        
        //llamada al rest
        let url = "https://fakebucks.azurewebsites.net/api/products/id"
        let parametros:Parameters = ["id":id_producto]
        
      //  var producto=[Producto]()
        
        request(url, method: .post, parameters: parametros, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler:{(resultado) in
            print(resultado)
        })
    
        return celda
        
    }
    
   
    @IBAction func BtnAñadirACarrito(_ sender: Any) {
        self.mostrardialogo(titulo: "Añadido", mensaje: "Fue Añadido correctamente")
        
    }
    
    func mostrardialogo(titulo:String,mensaje:String){
        let ventana = UIAlertController(title:titulo, message: mensaje,preferredStyle: .alert     )
        let accionOk = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        ventana.addAction(accionOk)
        self.present(ventana, animated: true, completion: nil)
    }
    
}
