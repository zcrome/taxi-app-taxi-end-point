//
//  TaxiOnline.swift
//  taxi-app-taxi-end-point
//
//  Created by zcrome on 10/24/17.
//  Copyright © 2017 zcrome. All rights reserved.
//

import Foundation


class TaxiOnline: Taxi{
  
  var lat = ""
  var long = ""
  
  override init(code: String, dni: String, name: String, lastName: String, address: String, carName: String, carLicensePlate: String, phone: String, email: String){
    super.init(code: code, dni: dni, name: name, lastName: lastName, address: address, carName: carName, carLicensePlate: carLicensePlate, phone: phone, email: email)
  }
  
  
}
