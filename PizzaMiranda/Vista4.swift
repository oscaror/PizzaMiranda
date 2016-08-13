//
//  Vista4.swift
//  PizzaMiranda
//
//  Created by Oscar  Ortega on 08/08/16.
//  Copyright © 2016 Oscar  Ortega. All rights reserved.
//

import UIKit

class Vista4: UIViewController {

    var masa : String = ""
    var tamaño : String = ""
    var especialidad : String = ""
    var ing1 : String = ""
    var ing2 : String = ""
    var ing3 : String = ""
    var ing4 : String = ""
    var direccion : String = ""
    
    @IBOutlet weak var lbl_Masa: UILabel!
    @IBOutlet weak var lbl_Tamano: UILabel!
    @IBOutlet weak var lbl_Ingredientes: UILabel!
    @IBOutlet weak var lbl_Direccion: UILabel!
    @IBOutlet weak var lbl_Precio: UILabel!
    
    @IBAction func btnCancelar(sender: UIButton) {
        let alerta = UIAlertView ()
        alerta.title = "Atención"
        alerta.message = "Haz cancelado tú orden, regresa pronto! 😊"
        alerta.addButtonWithTitle("Ok")
        alerta.show()
        
        self.navigationController?.popToRootViewControllerAnimated(true)

    }

    @IBAction func btn_Confirmar(sender: UIButton) {
        let alerta = UIAlertView ()
        alerta.title = "Gracias 😊"
        alerta.message = "Tu pizza llegara a tu domicilio en aproximadamente 40 min, que la disfrutes! 🍕"
        alerta.addButtonWithTitle("Ok")
        alerta.show()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configView
        let fondo = UIImage (named: "Fondo inicio.png")
        let imageFondo = UIImageView(image: fondo)
        imageFondo.frame = CGRect (x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        view.addSubview(imageFondo)
        //self.view.backgroundColor = (UIColor .whiteColor())
        
        let imagen = UIImage (named: "logoleft.png")
        let imageView = UIImageView(image: imagen)
        imageView.frame = CGRect (x: self.view.frame.width / 2 - 40, y: 115, width: 85, height: 70)
        view.addSubview(imageView)
        
        let bienvenido = UILabel (frame: CGRect (x: 0, y: 60, width: self.view.frame.size.width, height: 40))
        bienvenido.textAlignment = NSTextAlignment.Center
        bienvenido.adjustsFontSizeToFitWidth = true
        bienvenido.font = (UIFont(name: "Helvetica", size: 15))
        bienvenido.text = "Esta es tu pizza"
        bienvenido.numberOfLines = 0
        self.view.addSubview(bienvenido)
        
        self.view.sendSubviewToBack(imageFondo)
        //FIN CONFIGViEW

        lbl_Masa.text = masa
        lbl_Tamano.text = tamaño
        lbl_Direccion.text = direccion
        
        if (especialidad != ""){
            lbl_Ingredientes.text = especialidad
        }else {
            lbl_Ingredientes.text = "\(ing1), \(ing2), \(ing3), \(ing4)"
        }
        lbl_Direccion.numberOfLines = 0
        lbl_Direccion.sizeToFit()

        lbl_Ingredientes.numberOfLines = 0
        lbl_Ingredientes.sizeToFit()

        lbl_Precio.text = "Total: $ \(calculaPrecio(masa, tamaño: tamaño))"
        lbl_Precio.numberOfLines = 0
        lbl_Precio.sizeToFit()
        
        //Alerta Paso final
        let alerta = UIAlertView ()
        alerta.title = "Atención"
        alerta.message = "Una vez confirmada la orden no se puede cancelar"
        alerta.addButtonWithTitle("Ok")
        alerta.show()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //var opcionTamaño = ["", "Chica", "Mediana", "Grande", "Familiar"]
    //var opcionMasa = ["", "Clásica", "Crunchy", "Extra Queso"]

    
    func calculaPrecio (masa : String, tamaño : String) -> String{
        if (masa == "Extra Queso"){
            if (tamaño == "Grande"){
                return "229"
            }else if (tamaño == "Familiar"){
                return "269"
            }else if (tamaño == "Mediana"){
                return "199"
            }else{
                return "149"
            }
            
        }else if (masa == "Clásica"){
                if (tamaño == "Grande"){
                    return "199"
                }else if (tamaño == "Familiar"){
                    return "229"
                }else if (tamaño == "Mediana"){
                    return "169"
                }else{
                    return "129"
            }

        }else if (masa == "Crunchy"){
                if (tamaño == "Grande"){
                    return "209"
                }else if (tamaño == "Familiar"){
                    return "249"
                }else if (tamaño == "Mediana"){
                    return "189"
                }else{
                    return "149"
                }
        }
        return ""
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
