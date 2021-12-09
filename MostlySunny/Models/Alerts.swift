//
//  Alerts.swift
//  MostlySunny
//
//  Created by Mindy Douglas on 12/7/21.
//

import Foundation

struct Alerts: Codable {
  
  var event: String = ""
  var description: String = ""
  var sender: String = ""
  
  enum CodingKeys: String, CodingKey {
    case sender = "sender_name"
    case event, description
  }
}

