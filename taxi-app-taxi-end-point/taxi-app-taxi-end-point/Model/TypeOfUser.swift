//
//  TypeOfUser.swift
//  taxi-app-taxi-end-point
//
//  Created by zcrome on 10/15/17.
//  Copyright © 2017 zcrome. All rights reserved.
//

import Foundation

enum TypeOfUser{
  case taxi
  case client
}


protocol TypeOfUserProtocol{
  
  var typeUseIs: TypeOfUser { get }
  
  
}
