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
  var id: String?
    
    var latitude = ""
    var longitude = ""
    var isAutomaticCoordinates = true
    
  var connectionStatus: ConnectionStatus = .disconnected{
    didSet{
      if let label = connectionStatusLabel{
        label.text = connectionStatus.rawValue
      }
    }
  }
  var connectionStatusLabel: UILabel?
  var isAllowToSendManualCurrentLocation = false
  
  var currentTaxisOnlineTableView: UITableView?
  var currentCountTaxisOnline: UILabel?
  var currentTaxisOnline: [TaxiOnline]?{
    didSet{
      if let countTaxisLabel = currentCountTaxisOnline, let taxisOnline = currentTaxisOnline?.count{
        countTaxisLabel.text = "\(taxisOnline)"
      }
    }
  }
  
  
  func setTokenWith(JSON json: JSON)->Bool{
    if let token = json["id"].string{
      self.token = token
      return true
    }
    return false
  }
  
  func setIdWith(JSON json: JSON)->Bool{
    if let id = json["userId"].int{
      self.id = "\(id)"
      return true
    }
    return false
  }
  
  func setTaxisWith(JSON arrayJson: [JSON]){
    var taxisOnline: [TaxiOnline] = []
    for taxi in arrayJson{
      if let name = taxi["name"].string,
        let position = taxi["position"].dictionary,
        let lat = (position["lat"])?.double,
        let lng = (position["lng"])?.double{

        let taxiOnline = TaxiOnline(code: "",
                                   dni: "",
                                   name: name,
                                   lastName: "",
                                   address: "",
                                   carName: "",
                                   carLicensePlate: "",
                                   phone: "",
                                   email: "")
        taxiOnline.lat = "\(lat)"
        taxiOnline.long = "\(lng)"
        taxisOnline.append(taxiOnline)
      }
    }
    if taxisOnline.count > 0{
        Session.sharedInstance.currentTaxisOnline = taxisOnline
        if let tableView = currentTaxisOnlineTableView{
          tableView.reloadData()
        }
    }
  }
  
  func executeLogout(){
    taxi = nil
    token = nil
    id = nil
  }
  
}


