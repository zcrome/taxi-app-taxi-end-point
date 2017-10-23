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
      print("CLIENT=")
    }
    socket.on("who-are-you") {data, ack in
      self.socket.emit("token-Registration", ["type":  "TAXI"])
    }
    
    socket.on("connection-aproved", callback: {data, ack in
      if let array = data as? [JSON], let json = array.first, let message = json["message"].string{
        Session.sharedInstance.messageToUser = message
        Session.sharedInstance.connectionStatus = .connected
      }
    })
    
    socket.on("out") {data, ack in
      print("SOCKET DISCONECTED!!!")
      print(data)
      self.socket.disconnect()
    }
    
    socket.connect()
  }
  
  func executeDisconnection(){
    socket.emit("disconnect", ["id":  "im out!"])
  }
  
  func sendMyLocation(){
    if Session.sharedInstance.isAllowToSendCurrentLocation{
      
      
    }
  }
  
  
  
}
