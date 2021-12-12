//
//  Daily.swift
//  MostlySunny
//
//  Created by Mindy Douglas on 12/7/21.
//

import Foundation
import UserNotifications

struct Daily: Codable {
  
  var sunrise: Int
  var sunset: Int
  var temp: Temp
  var weather: [Weather]
  var pop: Double
  var dt: Double
}


