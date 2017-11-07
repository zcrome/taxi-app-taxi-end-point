//
//  ConfigurationViewController.swift
//  taxi-app-taxi-end-point
//
//  Created by zcrome on 10/24/17.
//  Copyright © 2017 zcrome. All rights reserved.
//

import UIKit

class ConfigurationViewController: UIViewController {

    
    @IBOutlet var latitudeTextField: UITextField!
    @IBOutlet var longTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func goToLogin(_ sender: Any) {
        
        performSegue(withIdentifier: "goToLogin", sender: nil)
        
        SocketClient.share.executeDisconnection()
    }
    
    
    @IBAction func activateManualCoord(_ sender: UISwitch) {
        
        if sender.isOn{
            Session.sharedInstance.isAutomaticCoordinates = false
            Session.sharedInstance.latitude = latitudeTextField.text!
            Session.sharedInstance.longitude = longTextField.text!
        }else{
            Session.sharedInstance.isAutomaticCoordinates = true
        }
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        latitudeTextField.resignFirstResponder()
        longTextField.resignFirstResponder()
    }
    
}

extension ConfigurationViewController: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField){
        if Session.sharedInstance.isAutomaticCoordinates == false{
            if textField == latitudeTextField{
                Session.sharedInstance.latitude = textField.text!
            }
            if textField == longTextField{
                Session.sharedInstance.longitude = textField.text!
            }
        }
    }
    
    
    
}



















