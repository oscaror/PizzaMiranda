//
//  Vista2.swift
//  PizzaMiranda
//
//  Created by Oscar  Ortega on 07/08/16.
//  Copyright © 2016 Oscar  Ortega. All rights reserved.
//

import UIKit

class Vista2: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerMasa: UITextField!
    @IBOutlet weak var pickerTamaño: UITextField!
    
    var opcionTamaño = ["", "Chica", "Mediana", "Grande", "Familiar"]
    var opcionMasa = ["", "Clásica", "Crunchy", "Extra Queso"]
    
    var tamaño = UIPickerView()
    var masa = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tamaño.showsSelectionIndicator = true
        masa.showsSelectionIndicator = true
        
        tamaño.delegate = self
        masa.delegate = self
        
        pickerMasa.inputView = masa
        pickerTamaño.inputView = tamaño
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(Vista2.donePicker))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        
        pickerTamaño.inputAccessoryView = toolBar
        pickerMasa.inputAccessoryView = toolBar
        
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
        bienvenido.text = "Selecciona el tamaño de tu pizza"
        bienvenido.numberOfLines = 0
        self.view.addSubview(bienvenido)

        self.view.sendSubviewToBack(imageFondo)
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func donePicker (sender:UIButton, pickerView: UIPickerView) {
            pickerMasa.resignFirstResponder()
            pickerTamaño.resignFirstResponder()
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if (pickerView == tamaño){
            return 1
        }else {
            return 1
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == tamaño){
            return opcionTamaño.count
        }else {
            return opcionMasa.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == masa){
            return opcionMasa[row]
        }else{
            return opcionTamaño[row]
        }
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == masa){
            pickerMasa.text = opcionMasa[row]
        }else{
            pickerTamaño.text = opcionTamaño[row]
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
            let destinationVC = segue.destinationViewController as? Vista3
            destinationVC?.masa = pickerMasa.text!
            destinationVC?.tamaño = pickerTamaño.text!
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if (identifier == "segueIngredientes"){
            
            if (pickerMasa.text! == "" || pickerTamaño.text! == ""){
                let alerta = UIAlertView ()
                alerta.title = "Atención"
                alerta.message = "No has seleccionado todos los campos"
                alerta.addButtonWithTitle("Ok")
                alerta.show()

                return false
            }
            else {
                return true
            }
        }
            return true
        
    }
    

}
