//
//  LoginViewController.swift
//  taxi-app-client-end-point
//
//  Created by zcrome on 10/14/17.
//  Copyright © 2017 zcrome. All rights reserved.
//

import UIKit
import CoreLocation

class LoginViewController: UIViewController {
  
  //**************************************
  //**** MARK: - Constraints outlets
  //**************************************
  
  //**************************************
  //**** MARK: - View outlets
  //**************************************
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  
  
  //**************************************
  //**** MARK: - Local constans and variables
  //**************************************
  let locationManager = CLLocationManager()
  
  
  //**************************************
  //**** MARK: - ViewController override definitions
  //**************************************
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    var locationManager : CLLocationManager = CLLocationManager()
//    locationManager.delegate = self
//    locationManager.requestAlwaysAuthorization()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    
    // Ask for Authorisation from the User.
    self.locationManager.requestAlwaysAuthorization()
    
    // For use in foreground
    self.locationManager.requestWhenInUseAuthorization()
    
    if CLLocationManager.locationServicesEnabled() {
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
      locationManager.startUpdatingLocation()
    }
    
  }
  
  //**************************************
  //**** MARK: - Actions and other outlets remaining
  //**************************************
  
  @IBAction func executeLogin(_ sender: UIButton) {
//    guard let email = emailTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty else{
//      print("show message")
//      return
//    }
//    Services.sharedInstance.executeTaxiLoginWith(Credentials: ["email": email, "password": password]) { isLoginSuccess in
//      if isLoginSuccess {
//        self.performSegue(withIdentifier: "toHome", sender: self)
//      }else{
//        print("WRONG")
//      }
//    }
    
    SocketClient.share.executeConnection()
  }
  
  @IBAction func dwdwdwdw(_ sender: Any) {
    
    SocketClient.share.executeDisconnection()
  }
  
  //**************************************
  //**** MARK: - Additional functions that may be require
  //**************************************
  
}

extension LoginViewController: CLLocationManagerDelegate{
  
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    var locValue:CLLocationCoordinate2D = manager.location!.coordinate
    print("locations = \(locValue.latitude) \(locValue.longitude)")
  }
  
}


