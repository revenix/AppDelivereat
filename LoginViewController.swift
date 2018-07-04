//
//  LoginViewController.swift
//  AppDelivereat
//
//  Created by Mac on 2/07/18.
//  Copyright © 2018 MoisesDev. All rights reserved.
//

import UIKit
import Alamofire


class LoginViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "menu_bg.jpg")!)
        // Do any additional setup after loading the view.
    }
    @IBAction func btnIngresar(_ sender: Any) {
        
        
        let userEmail = txtUser.text
        let userPassword = txtPassword.text
        
        var url = "https://fakebucks.azurewebsites.net/api/usuarios/login"
        var parametros:Parameters = ["correo":userEmail , "clave":userPassword]
        
        if ( isValidEmail(string: userEmail! ) == true  ){
            
            request(url, method: .post, parameters: parametros, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { (resultado) in
                
                switch(resultado.result) {
                case .failure(let error):
                    self.mostrardialogo(titulo: "Error", mensaje: "error en el servicio")
                case .success(let value):
                    if(resultado.response?.statusCode == 200){
                        //validar el login
                     self.performSegue(withIdentifier: "segueLogin", sender: self)
                          // self.mostrardialogo(titulo: "AVISO", mensaje: "Correcto")
                    }
                    if (resultado.response?.statusCode == 401){
                        self.mostrardialogo(titulo: "Error", mensaje: "Correo o Clave Incorrecto")
                    }
                    
                }
                
                
            })
            
        }else{
            self.mostrardialogo(titulo: "Error", mensaje:"Correo incorrecto")
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isValidEmail(string: String) -> Bool {
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailReg)
        return emailTest.evaluate(with: string)
    }
    
    func mostrardialogo(titulo:String,mensaje:String){
        let ventana = UIAlertController(title:titulo, message: mensaje,preferredStyle: .alert     )
        let accionOk = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        ventana.addAction(accionOk)
        self.present(ventana, animated: true, completion: nil)
    }

}
