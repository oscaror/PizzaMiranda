//
//  VistaQuejas.swift
//  PizzaMiranda
//
//  Created by Oscar  Ortega on 09/08/16.
//  Copyright © 2016 Oscar  Ortega. All rights reserved.
//

import UIKit

class VistaQuejas: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIScrollViewDelegate {
    
    let scrollView = UIScrollView (frame: UIScreen.mainScreen().bounds)
    //var scrollView : UIScrollView!
    
    let txtNombre = UITextField ()
    let txtCorreo = UITextField ()
    let txtSucursal = UITextField ()
    let txtComentario = UITextView ()
    
    @IBAction func enviarComentario(sender: AnyObject) {
        

        
        if (txtNombre.text! != "" && txtComentario.text! != "" && txtSucursal.text! != "" && txtSucursal.text! != ""){
            txtNombre.text = nil
            txtCorreo.text = nil
            txtSucursal.text = nil
            txtComentario.text = nil
            let alerta = UIAlertView ()
            alerta.title = "Atención"
            alerta.message = "Tú comentario se ha enviado correctamente, Te garantizamos que lo tomaremos muy en serio"
            alerta.addButtonWithTitle("OK")
            alerta.show()
            txtComentario.text = "Ingresa tus comentarios aquí"
            txtComentario.textColor = UIColor.lightGrayColor()
        }else {
            let alerta = UIAlertView ()
            alerta.title = "Atención"
            alerta.message = "Debes llenar todos los campos para proceder"
            alerta.addButtonWithTitle("OK")
            alerta.show()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let fondo = UIImage (named: "Fondo inicio.png")
        let imageFondo = UIImageView(image: fondo)
        imageFondo.frame = CGRect (x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        view.addSubview(imageFondo)
        
        //self.scrollView = UIScrollView()
        self.scrollView.delegate = self
        view.addSubview(scrollView)
        scrollView.scrollEnabled = true
        
        
//        self.scrollView.addSubview(txtComentario)

        let lblNombre = UILabel (frame: CGRect (x:20, y:220, width: 70, height: 30))
        lblNombre.textAlignment = NSTextAlignment.Left
        lblNombre.adjustsFontSizeToFitWidth = true
        lblNombre.font = (UIFont(name: "Helvetica", size: 17))
        lblNombre.text = "Nombre: "
        lblNombre.numberOfLines = 0
        self.scrollView.addSubview(lblNombre)
        
        let lblCorreo = UILabel (frame: CGRect (x:20, y:260, width: 70, height: 30))
        lblCorreo.textAlignment = NSTextAlignment.Left
        lblCorreo.adjustsFontSizeToFitWidth = true
        lblCorreo.font = (UIFont(name: "Helvetica", size: 17))
        lblCorreo.text = "Correo: "
        lblCorreo.numberOfLines = 0
        self.scrollView.addSubview(lblCorreo)
        
        let lblSucursal = UILabel (frame: CGRect (x:20, y:300, width: 70, height: 30))
        lblSucursal.textAlignment = NSTextAlignment.Left
        lblSucursal.adjustsFontSizeToFitWidth = true
        lblSucursal.font = (UIFont(name: "Helvetica", size: 17))
        lblSucursal.text = "Sucursal: "
        lblSucursal.numberOfLines = 0
        self.scrollView.addSubview(lblSucursal)
        
        txtNombre.frame = CGRectMake (110, 220, 180, 30)
        //txtNombre.placeholder = "Nombre"
        txtNombre.backgroundColor = (UIColor .whiteColor())
        txtNombre.borderStyle = UITextBorderStyle.RoundedRect
        txtNombre.textAlignment = NSTextAlignment.Left
        txtNombre.adjustsFontSizeToFitWidth = true
        txtNombre.font = (UIFont(name: "Helvetica", size: 15))
        txtNombre.delegate = self
        self.scrollView.addSubview(txtNombre)
 
        
        txtCorreo.frame = CGRectMake (110, 260, 180, 30)
        txtCorreo.textAlignment = NSTextAlignment.Left
        txtCorreo.backgroundColor = (UIColor .whiteColor())
        txtCorreo.borderStyle = UITextBorderStyle.RoundedRect
        txtCorreo.adjustsFontSizeToFitWidth = true
        txtCorreo.font = (UIFont(name: "Helvetica", size: 15))
        txtCorreo.delegate = self
        self.scrollView.addSubview(txtCorreo)
        
         txtSucursal.frame = CGRectMake (110, 300, 180, 30)
        txtSucursal.textAlignment = NSTextAlignment.Left
        txtSucursal.backgroundColor = (UIColor .whiteColor())
        txtSucursal.borderStyle = UITextBorderStyle.RoundedRect
        txtSucursal.adjustsFontSizeToFitWidth = true
        txtSucursal.font = (UIFont(name: "Helvetica", size: 15))
        txtSucursal.delegate = self
        self.scrollView.addSubview(txtSucursal)
    
        txtComentario.frame = CGRectMake (50, 350, 210, 190)
        txtComentario.textAlignment = NSTextAlignment.Left
        txtComentario.text = "Ingresa tus comentarios aquí"
        txtComentario.textColor = UIColor.lightGrayColor()
        txtComentario.backgroundColor = (UIColor .whiteColor())
        txtComentario.font = (UIFont(name: "Helvetica", size: 15))
        txtComentario.delegate = self
        self.scrollView.addSubview(txtComentario)
        
        //self.txtComentario.delegate = self
        
        

        //self.view.backgroundColor = (UIColor .whiteColor())
        
        let bienvenido = UILabel (frame: CGRect (x: 0, y: 60, width: self.view.frame.size.width, height: 40))
        bienvenido.textAlignment = NSTextAlignment.Center
        bienvenido.adjustsFontSizeToFitWidth = true
        bienvenido.font = (UIFont(name: "Helvetica", size: 15))
        bienvenido.text = "Quejas y Sugerencias"
        bienvenido.numberOfLines = 0
        self.scrollView.addSubview(bienvenido)

        let imagen = UIImage (named: "logoleft.png")
        let imageView = UIImageView(image: imagen)
        imageView.frame = CGRect (x: self.view.frame.width / 2 - 40, y: 115, width: 85, height: 70)
        scrollView.addSubview(imageView)
        


       
        
        
//        self.view.bringSubviewToFront(lblNombre)
//        self.view.bringSubviewToFront(lblCorreo)
//        self.view.bringSubviewToFront(lblSucursal)
//        self.view.bringSubviewToFront(txtCorreo)
//        self.view.bringSubviewToFront(txtNombre)
//        self.view.bringSubviewToFront(txtSucursal)
//        self.view.bringSubviewToFront(txtComentario)
        
        //self.view.bringSubviewToFront(scrollView)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(VistaQuejas.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        //self.view.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height)
        self.scrollView.contentSize = CGSizeMake(0, 700)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard () {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    func textViewDidBeginEditing(textView: UITextView) {
        if (textView.textColor == UIColor.lightGrayColor()){
            textView.text = nil
            textView.textColor = UIColor.blackColor()
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if (textView.text.isEmpty){
            textView.text = "Ingresa tus comentarios aquí"
            textView.textColor = UIColor.lightGrayColor()
        }
    }
//    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
//        if (text == "\n"){
//            txtComentario.resignFirstResponder()
//            return false
//        }
//        return true
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
