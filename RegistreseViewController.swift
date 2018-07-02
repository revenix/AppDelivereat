//
//  RegistreseViewController.swift
//  AppDelivereat
//
//  Created by Mac on 2/07/18.
//  Copyright © 2018 MoisesDev. All rights reserved.
//

import UIKit
import Alamofire


class RegistreseViewController: UIViewController {

    @IBOutlet weak var txtDni: UITextField!
    @IBOutlet weak var txtNombr: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var txtDireccion: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtClave: UITextField!
    @IBOutlet weak var txtConfirmClave: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnRegistrar(_ sender: Any) {
        
        
        let userEmail = txtCorreo.text
        
        let dni = txtDni.text
        
        if txtClave.text != txtConfirmClave.text{
            
            self.mostrardialogo(titulo: "ERROR", mensaje: "Claves no Coinciden")
            
        }
        else
        {
            if ( isOnlyNumbers(string: dni! ) == true  ){
                
                if ( isValidEmail(string: userEmail! ) == true  ){
                    //llamada al servicio Rest
                    
                    var url = "https://fakebucks.azurewebsites.net/api/usuarios"
                    var parametros:Parameters = ["dni":txtDni.text,"nombre":txtNombr.text,"apellido":txtApellido.text,
                                                 "direccion":txtDireccion.text,"correo":txtCorreo.text,"clave":txtClave.text]
                    
                    request(url, method: .post, parameters: parametros, encoding: JSONEncoding.default    , headers: nil).responseJSON(completionHandler:{(resultado) in
                        
                        switch(resultado.result)
                        {
                        case .success(let value):
                            if(resultado.response?.statusCode == 200){ 
                                self.mostrardialogo(titulo:"Aviso", mensaje: "usuario registrado correctamente")
                                self.dismiss(animated: true, completion: nil)
                            }else{
                                self.mostrardialogo(titulo: "Error", mensaje: "Error")
                                
                            }
                        case .failure(let error):
                            self.mostrardialogo(titulo: "Error", mensaje: "Error al registra usuario")
                        }
                        
                    })
                    
                }else{
                    
                    self.mostrardialogo(titulo: "Error", mensaje: "ingresar correo valido")
                    
                    
                }
            }else{
                self.mostrardialogo(titulo: "Error", mensaje: "Ingresar DNI valido")
                
            }
            
        }
        
        
        
        
        
    }
    
    @IBAction func btnRegresar(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)

        
    }
    
    func mostrardialogo(titulo:String,mensaje:String){
        let ventana = UIAlertController(title:titulo, message: mensaje,preferredStyle: .alert     )
        let accionOk = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        ventana.addAction(accionOk)
        self.present(ventana, animated: true, completion: nil)
    }
    
    
    func isOnlyNumbers(string: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "\\d{8}").evaluate(with: string)
    }
    
    func isValidEmail(string: String) -> Bool {
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailReg)
        return emailTest.evaluate(with: string)
    }
    
    
}
