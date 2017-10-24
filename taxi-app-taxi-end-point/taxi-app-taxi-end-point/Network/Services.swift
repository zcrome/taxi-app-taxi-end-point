//
//  Services.swift
//  taxi-app-taxi-end-point
//
//  Created by zcrome on 10/15/17.
//  Copyright © 2017 zcrome. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class Services{
  static let sharedInstance = Services()
  private init(){}
  
  
  private let BASE_IP = "http://localhost"
  private let PORT = "3000"
  
  private let URL_API_TAXI = "/api/Taxis"
  private let URL_API_LOGIN = "/login"
  
  
  
  
  func executeTaxiLoginWith(Credentials credentials: [String:Any], AndObtain callback: @escaping (_ response: Bool) -> Void){
    Alamofire.request("\(BASE_IP):\(PORT)\(URL_API_TAXI)\(URL_API_LOGIN)", method: .post, parameters: credentials).responseJSON { response in
      guard let data = response.data else{
        callback(false)
        return
      }
      print("******************************************")
      print(JSON(data: data))
      print("******************************************")
      Session.sharedInstance.taxi = Taxi(TaxiJSON: JSON(data: data))
      callback(Session.sharedInstance.setTokenWith(JSON: JSON(data: data)) && Session.sharedInstance.setIdWith(JSON: JSON(data: data)))
    }
  }
  
  func executeRegistrationOf(Taxi taxi: [String: Any],AndObtain callback: @escaping (_ response: (status: Bool, taxiId: String?))->Void){
    Alamofire.request("\(BASE_IP):\(PORT)\(URL_API_TAXI)", method: .post, parameters: taxi).responseJSON { response in
      guard let data = response.data else{
        callback((status: false, taxiId: nil))
        return
      }
      print("******************************************")
      print(JSON(data: data))
      print("******************************************")
      let json = JSON(data: data)
      if let id = json["id"].int{
        callback((status: true, taxiId: String(id)))
        return
      }
      callback((status: false, taxiId: nil))
    }
  }
  
  
  
  
  
  
}
