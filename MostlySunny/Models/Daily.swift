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
  var temp: DailyTemp
  var weather: [Weather]
  var pop: Double

}
