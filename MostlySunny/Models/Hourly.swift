//
//  Hourly.swift
//  MostlySunny
//
//  Created by Mindy Douglas on 12/7/21.
//

import Foundation

struct Hourly: Codable {
  
  var temp: Double
  var feelsLike: Double
  var weather: [Weather]
  var pop: Double
  var humidity: Int
  var dt: Double
  
  enum CodingKeys: String, CodingKey {
    case feelsLike = "feels_like"
    case temp, weather, pop, humidity, dt
  }
  
}
