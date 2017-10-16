//
//  Taxi.swift
//  taxi-app-taxi-end-point
//
//  Created by zcrome on 10/15/17.
//  Copyright © 2017 zcrome. All rights reserved.
//

import Foundation
import SwiftyJSON

class Taxi: TypeOfUserProtocol{
  
  var id: String
  var code: String
  var dni: String
  var name: String
  var lastName: String
  var address: String
  var carName: String
  var carLicensePlate: String
  var phone: String
  var email: String
  let typeUseIs: TypeOfUser = .taxi
  var isValid: Bool{
    if id.isEmpty{
      return false
    }
    return true
  }
  
  
  init(code: String,dni: String,name: String,lastName: String,address: String,carName: String,carLicensePlate: String,phone: String,email: String) {
    self.code = code
    self.dni = dni
    self.name = name
    self.lastName = lastName
    self.address = address
    self.carName = carName
    self.carLicensePlate = carLicensePlate
    self.phone = phone
    self.email = email
    self.id = ""
  }
  
  init(TaxiJSON json: JSON) {
    
    if let id = json["userId"].string{
      self.id = id
    }else{
      self.id = ""
    }
    
    if let code = json["code"].string{
      self.code = code
    }else{
      self.code = ""
    }
    
    if let dni = json["dni"].string{
      self.dni = dni
    }else{
      self.dni = ""
    }
    
    if let name = json["name"].string{
      self.name = name
    }else{
      self.name = ""
    }
    
    if let lastName = json["lastName"].string{
      self.lastName = lastName
    }else{
      self.lastName = ""
    }
    
    if let address = json["address"].string{
      self.address = address
    }else{
      self.address = ""
    }
    
    if let carName = json["carName"].string{
      self.carName = carName
    }else{
      self.carName = ""
    }
    
    if let carLicensePlate = json["carLicensePlate"].string{
      self.carLicensePlate = carLicensePlate
    }else{
      self.carLicensePlate = ""
    }
    
    if let phone = json["phone"].string{
      self.phone = phone
    }else{
      self.phone = ""
    }
    
    if let email = json["email"].string{
      self.email = email
    }else{
      self.email = ""
    }
  }
  
  
  
  
}


