//
//  TypeOfUser.swift
//  taxi-app-taxi-end-point
//
//  Created by zcrome on 10/15/17.
//  Copyright © 2017 zcrome. All rights reserved.
//

import Foundation

enum TypeOfUser: String{
  case taxi = "TAXI"
  case client = "CLIENT"
}


protocol TypeOfUserProtocol{
  var typeUseIs: TypeOfUser { get }
}
