//
//  Session.swift
//  taxi-app-taxi-end-point
//
//  Created by zcrome on 10/15/17.
//  Copyright © 2017 zcrome. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreLocation

class Session{
  static let sharedInstance = Session()
  private init(){
  }
  
  var taxi: Taxi?
  var token: String?
  var messageToUser = ""
  var connectionStatus: ConnectionStatus = .disconnected
  var isAllowToSendCurrentLocation = false
  
  
  func setTokenWith(JSON json: JSON)->Bool{
    if let token = json["id"].string{
      self.token = token
      return true
    }
    return false
  }
  func executeLogout(){
    taxi = nil
    token = nil
  }
  
}


