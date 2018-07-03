//
//  MenuPrincipalViewController.swift
//  AppDelivereat
//
//  Created by Mac on 3/07/18.
//  Copyright © 2018 MoisesDev. All rights reserved.
//

import UIKit

class MenuPrincipalViewController: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
    
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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "Celda", for: indexPath) as! ProductsCVCell
        celda.txtNombre.text = products[indexPath.item]
        celda.txtPrecio.text = products[indexPath.item]
        celda.imgProduct.image = productsImages[indexPath.item]
        
        return celda
    }

}
