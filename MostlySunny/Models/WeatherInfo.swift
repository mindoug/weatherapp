//
//  WeatherInfo.swift
//  MostlySunny
//
//  Created by Mindy Douglas on 12/6/21.
//

import Foundation
import UIKit

struct WeatherInfo: Codable {
  
  var lat: Double
  var lon: Double
  var current: Current
  var hourly: [Hourly]
  var daily: [Daily]
  
}


