//
//  ShowAlert.swift
//  taxi-app-taxi-end-point
//
//  Created by zcrome on 10/24/17.
//  Copyright © 2017 zcrome. All rights reserved.
//
import UIKit
import Foundation


extension UIViewController {
  
  func showError(error:NSError) {
    showAlert(message: error.localizedDescription)
  }
  
  func showAlert(message:String) {
    let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "Aceptar", style: .cancel, handler: nil))
    self.present(alertController, animated: true, completion: nil)
  }
}
