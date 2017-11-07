//
//  SocketClient.swift
//  taxi-app-taxi-end-point
//
//  Created by zcrome on 10/21/17.
//  Copyright © 2017 zcrome. All rights reserved.
//

import Foundation
import SocketIO
import SwiftyJSON

class SocketClient{
  let socket = SocketIOClient(socketURL: URL(string: "http://localhost:3001")!, config: [.log(true), .compress])
  static var share: SocketClient = SocketClient()
  private init() {
  }
  
  func executeConnection(){
    socket.on(clientEvent: .connect) {data, ack in
      print("***********")
      print("STARTING CONNECTION")
    }
    socket.on("who-are-you") {data, ack in
      self.socket.emit("token-Registration", ["type":  TypeOfUser.taxi.rawValue])
    }
    
    socket.on("connection-aproved", callback: {data, ack in
      let array = JSON(arrayLiteral: data)
      Session.sharedInstance.setTaxisWith(JSON: array[0][0].arrayValue)
      Session.sharedInstance.connectionStatus = .connected
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        self.socket.emit("token-Registration", ["type":  TypeOfUser.taxi.rawValue])
      }
    })
    
    socket.connect()
  }
  func executeDisconnection(){
    if let id = Session.sharedInstance.id{
        print(id)
        socket.emit("disconnect", ["id": id])
        self.socket.disconnect()
        Session.sharedInstance.executeLogout()
    }
  }
  
  func sendMyGPSLocationWith(Lat lat: String, Long long: String, AndId id: String){
    socket.emit("myTaxiLocation", ["lat":  lat, "long": long, "id": id])
  }
  
//  func sendMyLocation(){
//    if Session.sharedInstance.isAllowToSendCurrentLocation{
//
//
//    }
//  }
  
  
  
}
