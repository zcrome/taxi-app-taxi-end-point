//
//  LoginViewController.swift
//  taxi-app-client-end-point
//
//  Created by zcrome on 10/14/17.
//  Copyright © 2017 zcrome. All rights reserved.
//

import UIKit


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
  
  
  
  //**************************************
  //**** MARK: - ViewController override definitions
  //**************************************
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
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
    
    
  }
  
  //**************************************
  //**** MARK: - Actions and other outlets remaining
  //**************************************
  
  @IBAction func executeLogin(_ sender: UIButton) {
    guard let email = emailTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty else{
      showAlert(message: "Ingrese todos los campos")
      return
    }
    Services.sharedInstance.executeTaxiLoginWith(Credentials: ["email": email, "password": password]) { isLoginSuccess in
      if isLoginSuccess {
        self.performSegue(withIdentifier: "toHome", sender: self)
      }else{
        self.showAlert(message: "Servicio no disponible")
      }
    }
  }
  //**************************************
  //**** MARK: - Additional functions that may be require
  //**************************************
  
}




