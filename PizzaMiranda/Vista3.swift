//
//  Vista3.swift
//  PizzaMiranda
//
//  Created by Oscar  Ortega on 07/08/16.
//  Copyright © 2016 Oscar  Ortega. All rights reserved.
//

import UIKit

class Vista3: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    var masa : String = ""
    var tamaño : String = ""

    var especialidadPicker = UIPickerView ()
    var opcionEspecialidades = ["", "Hawaiana", "Vegetariana", "Mexicana", "Pastor", "Carnes frías", "Minoni"]
    
    var ingPicker = UIPickerView()
    var ing2Picker = UIPickerView()
    var ing3Picker = UIPickerView ()
    var ing4Picker = UIPickerView ()

    var opcionIngredientes = ["", "Peperoni", "Jamón", "Queso", "Piña", "Pastor", "Atún", "Carne", "Chorizo", "Pimiento", "Tomate", "Aceitunas", "Champiñones"]

    
    @IBOutlet weak var especialidadText: UITextField!
    @IBOutlet weak var ingredientesText: UITextField!

    @IBOutlet weak var ing2: UITextField!
    @IBOutlet weak var ing3: UITextField!
    @IBOutlet weak var ing4: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("pizza", masa, tamaño)
        
        especialidadText.delegate = self
        ingredientesText.delegate = self
        ing2.delegate = self
        ing3.delegate = self
        ing4.delegate = self
        
        especialidadPicker.showsSelectionIndicator = true
        especialidadPicker.delegate = self
        especialidadText.inputView = especialidadPicker
        
        ingPicker.showsSelectionIndicator = true
        ingPicker.delegate = self
        ingredientesText.inputView = ingPicker
//
        ing2Picker.showsSelectionIndicator = true
        ing2Picker.delegate = self
        ing2.inputView = ing2Picker
        
        ing3Picker.showsSelectionIndicator = true
        ing3Picker.delegate = self
        ing3.inputView = ing3Picker
        
        
        ing4Picker.showsSelectionIndicator = true
        ing4Picker.delegate = self
        ing4.inputView = ing4Picker
        
        //barra del picker
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(Vista3.donePicker))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        
        especialidadText.inputAccessoryView = toolBar
        ingredientesText.inputAccessoryView = toolBar
        ing2.inputAccessoryView = toolBar
        ing3.inputAccessoryView = toolBar
        ing4.inputAccessoryView = toolBar
        
        //config view
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
        bienvenido.text = "Selecciona una especialidad"
        bienvenido.numberOfLines = 0
        self.view.addSubview(bienvenido)
        
        self.view.sendSubviewToBack(imageFondo)
        
        especialidadText.addTarget(self, action: #selector(Vista3.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingDidEnd)
        ingredientesText.addTarget(self, action: #selector(Vista3.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingDidEnd)
        ing2.addTarget(self, action: #selector(Vista3.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingDidEnd)
        ing3.addTarget(self, action: #selector(Vista3.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingDidEnd)
        ing4.addTarget(self, action: #selector(Vista3.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingDidEnd)
        //fin config view

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func donePicker (sender: UIButton){
        especialidadText.resignFirstResponder()
        ingredientesText.resignFirstResponder()
        ing2.resignFirstResponder()
        ing3.resignFirstResponder()
        ing4.resignFirstResponder()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if (pickerView == especialidadPicker){
            return 1
        }else if (pickerView == ingPicker){
            return 1
        }else if (pickerView == ing2Picker){
            return 1
        }else if (pickerView == ing3Picker){
            return 1
        }else{
            return 1
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == especialidadPicker){
            return opcionEspecialidades.count
        }else{
            return opcionIngredientes.count
        }

    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == especialidadPicker){
            return opcionEspecialidades[row]
        }else{
            return opcionIngredientes[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == especialidadPicker){
            especialidadText.text = opcionEspecialidades[row]
        }else if (pickerView == ingPicker){
            ingredientesText.text = opcionIngredientes[row]
        }else if (pickerView == ing2Picker){
            ing2.text = opcionIngredientes[row]
        }else if (pickerView == ing3Picker){
            ing3.text = opcionIngredientes[row]
        }else if (pickerView == ing4Picker){
            ing4.text = opcionIngredientes[row]
      
        }


    }

    func textFieldDidChange (textField: UITextField){
        if (textField == especialidadText){
            if (textField.text! != ""){
                ingredientesText.userInteractionEnabled = false
                ing2.userInteractionEnabled = false
                ing3.userInteractionEnabled = false
                ing4.userInteractionEnabled = false
            }else {
                ingredientesText.userInteractionEnabled = true
                ing2.userInteractionEnabled = true
                ing3.userInteractionEnabled = true
                ing4.userInteractionEnabled = true
            }
        }else if (textField == ingredientesText || textField == ing2 || textField == ing3 || textField == ing3){
            if (textField.text! != ""){
                especialidadText.userInteractionEnabled = false
            }else {
                especialidadText.userInteractionEnabled = true
            }
        }
    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if (identifier == "segueMapa"){

            if (especialidadText.text! == "" && ingredientesText.text! == "" && ing2.text! == "" && ing3.text! == "" && ing4.text! == ""){
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

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as? VistaMapa
        destinationVC?.masa = masa
        destinationVC?.tamaño = tamaño
        destinationVC?.especialidad = especialidadText.text!
        destinationVC?.ing1 = ingredientesText.text!
        destinationVC?.ing2 = ing2.text!
        destinationVC?.ing3 = ing3.text!
        destinationVC?.ing4 = ing4.text!
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
