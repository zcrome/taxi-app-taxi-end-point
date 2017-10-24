//
//  RegisterViewController.swift
//  taxi-app-client-end-point
//
//  Created by zcrome on 10/14/17.
//  Copyright © 2017 zcrome. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

  //**************************************
  //**** MARK: - Constraints outlets
  //**************************************
  
  //**************************************
  //**** MARK: - View outlets
  //**************************************
  
  @IBOutlet weak var codeTextField: UITextField!
  @IBOutlet weak var dniTextField: UITextField!
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var addressTextField: UITextField!
  @IBOutlet weak var carModelNameTextField: UITextField!
  @IBOutlet weak var licensePlateTextField: UITextField!
  @IBOutlet weak var phoneTextField: UITextField!
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
  
  //**************************************
  //**** MARK: - Actions and other outlets remaining
  //**************************************
  
  
  @IBAction func executeRegister(_ sender: UIButton) {
    
    
    guard let code = codeTextField.text,
      let dni = dniTextField.text,
      let name = nameTextField.text,
      let lastName = lastNameTextField.text,
      let address = addressTextField.text,
      let carModel = carModelNameTextField.text,
      let licensePlate = licensePlateTextField.text,
      let phone = phoneTextField.text,
      let email = emailTextField.text,
      let password = passwordTextField.text else{
      
      print("error con textfield")
      return
    }
    
    let parameters = ["code": code,
                      "dni": dni,
                      "name": name,
                      "lastName": lastName,
                      "address": address,
                      "carName": carModel,
                      "carLicensePlate": licensePlate,
                      "phone": phone,
                      "email": email,
                      "password": password]
    
    Services.sharedInstance.executeRegistrationOf(Taxi: parameters) { (response) in
      if response.status, let _ = response.taxiId{
        self.performSegue(withIdentifier: "toLoginAfterRegister", sender: self)
      }else{
        self.showAlert(message: "No se pudo crear usuario. Intente con otro email.")
      }
    }
  }
  
  
  
  
  
  //**************************************
  //**** MARK: - Additional functions that may be require
  //**************************************

}
