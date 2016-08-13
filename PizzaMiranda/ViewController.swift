//
//  ViewController.swift
//  PizzaMiranda
//
//  Created by Oscar  Ortega on 05/08/16.
//  Copyright © 2016 Oscar  Ortega. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        
        let fondo = UIImage (named: "Fondo inicio.png")
        let imageFondo = UIImageView(image: fondo)
        imageFondo.frame = CGRect (x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        view.addSubview(imageFondo)
        //self.view.backgroundColor = (UIColor .whiteColor())
        
        let bienvenido = UILabel (frame: CGRect (x: 0, y: 60, width: self.view.frame.size.width, height: 40))
        bienvenido.textAlignment = NSTextAlignment.Center
        bienvenido.adjustsFontSizeToFitWidth = true
        bienvenido.font = (UIFont(name: "Helvetica", size: 15))
        bienvenido.text = "Bienvenido a Pizzas Minoni"
        bienvenido.numberOfLines = 0
        self.view.addSubview(bienvenido)
        
        let iniciar = UIButton (frame: CGRect(x: 110, y: 270, width: 100, height: 40))
        iniciar.setTitle("Iniciar pedido", forState: UIControlState.Normal)
        iniciar.titleLabel?.adjustsFontSizeToFitWidth = true
        iniciar.titleLabel?.font = (UIFont(name: "Helvetica", size: 14))
        iniciar.setTitleColor(UIColor .blackColor(), forState: .Normal)
        iniciar.addTarget(self, action: #selector(iniciarFlujo), forControlEvents: .TouchUpInside)
        //iniciar.center = self.view.center
        iniciar.setTitleColor(UIColor .orangeColor(), forState: .Normal)
        self.view.addSubview(iniciar)
        
        
        let quejas = UIButton (frame: CGRect(x: 92, y: 320, width: 130, height: 40))
        quejas.setTitle("Quejas y Sugerencias", forState: UIControlState.Normal)
        quejas.titleLabel?.adjustsFontSizeToFitWidth = true
        quejas.titleLabel?.font = (UIFont(name: "Helvetica", size: 14))
        quejas.setTitleColor(UIColor .blackColor(), forState: .Normal)
        quejas.addTarget(self, action: #selector(mostrarQuejas), forControlEvents: .TouchUpInside)
        
        quejas.setTitleColor(UIColor .orangeColor(), forState: .Normal)
        self.view.addSubview(quejas)
        
        
        let imagen = UIImage (named: "logoleft.png")
        let imageView = UIImageView(image: imagen)
        imageView.frame = CGRect (x: self.view.frame.width / 2 - 40, y: 115, width: 85, height: 70)
        view.addSubview(imageView)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    func iniciarFlujo (sender: UIButton){
        print ("funciona")
        performSegueWithIdentifier("segueMasa", sender: nil)
        //self.navigationController?.pushViewController(Vista2, animated: true)
    }

    func mostrarQuejas (sender: UIButton){
        performSegueWithIdentifier("segueQuejas", sender: nil)
    }
}

