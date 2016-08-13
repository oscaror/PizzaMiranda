//
//  VistaMapa.swift
//  PizzaMiranda
//
//  Created by Oscar  Ortega on 08/08/16.
//  Copyright © 2016 Oscar  Ortega. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class VistaMapa: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var botonSiguiente: UIBarButtonItem!
    
    @IBOutlet weak var mapKit: MKMapView!
    
    @IBOutlet weak var direccionActual: UILabel!

    var masa : String = ""
    var tamaño : String = ""
    var especialidad : String = ""
    var ing1 : String = ""
    var ing2 : String = ""
    var ing3 : String = ""
    var ing4 : String = ""
    
    var numeroActual : String = ""
    var calleActual : String = ""
    var cpActual : String = ""
    var localidadActual : String = ""
    var estadoActual : String = ""
    
    var locationManager = CLLocationManager()
    var direccion : String = ""
    
    func checkLocationAuthorizationStatus (){
        if #available(iOS 8.0, *) {
            if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse{
                locationManager.startUpdatingLocation()
                mapKit.showsUserLocation = true
            }else {
                locationManager.requestWhenInUseAuthorization()
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        //let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        //let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        let latitude: CLLocationDegrees = location!.coordinate.latitude
        let longitude : CLLocationDegrees = location!.coordinate.longitude
        let latDelta : CLLocationDegrees = 0.01
        let lonDelta : CLLocationDegrees = 0.01
        let span : MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        let location2 : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region : MKCoordinateRegion = MKCoordinateRegionMake(location2, span)
        mapKit.setRegion(region, animated: true)
        //self.mapKit.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
        
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)-> Void in
            if (error != nil){
                return
            }
            
            if placemarks!.count > 0
            { let pm = placemarks![0] as CLPlacemark
                self.displayLocationInfo(pm)
            }
        })

    }
    
    
    func displayLocationInfo (placemark : CLPlacemark?){
        if let containsPlacemark = placemark{
            let address = (containsPlacemark.thoroughfare != nil) ? containsPlacemark.thoroughfare : ""
            let number = (containsPlacemark.subThoroughfare != nil) ? containsPlacemark.subThoroughfare : ""
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            numeroActual = number!
            calleActual = address!
            localidadActual = locality!
            cpActual = postalCode!
            estadoActual = administrativeArea!
            
            direccionActual.text = "\(calleActual), \(numeroActual), \(localidadActual), \(cpActual)"
            direccionActual.numberOfLines = 0
            direccionActual.sizeToFit()
            
            print (address)
            print (number)
            print(locality)
            print(postalCode)
            print(administrativeArea)
            print (country)
            print ()
            print (numeroActual)
            print(calleActual)
            print(localidadActual)
            print(cpActual)
            print(estadoActual)
         
            
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        let alerta = UIAlertView ()
        alerta.title = "Atención"
        alerta.message = "Hubo un error, intenta de nuevo más tarde"
        alerta.addButtonWithTitle("Ok")
        alerta.show()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        mapKit.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //CONGIG VIEW
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
        bienvenido.text = "Enviaremos tú pizza a esta ubicación"
        bienvenido.numberOfLines = 0
        self.view.addSubview(bienvenido)
        
        self.view.sendSubviewToBack(imageFondo)
        //END CONGIFVIEW
       
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as? Vista4
        
        destinationVC?.masa = masa
        destinationVC?.tamaño = tamaño
        destinationVC?.especialidad = especialidad
        destinationVC?.ing1 = ing1
        destinationVC?.ing2 = ing2
        destinationVC?.ing3 = ing3
        destinationVC?.ing4 = ing4
        destinationVC?.direccion = direccionActual.text!
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
