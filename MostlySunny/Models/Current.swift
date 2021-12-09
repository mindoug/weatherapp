//
//  Current.swift
//  MostlySunny
//
//  Created by Mindy Douglas on 12/7/21.
//

import Foundation

struct Current: Codable {

  var sunrise: Int
  var sunset: Int
  var temp: Double
  var feelsLike: Double
  var humidity: Int
  var clouds: Int
  var weather: [Weather]
  
  enum CodingKeys: String, CodingKey {
    case feelsLike = "feels_like"
    case sunrise, sunset, temp, humidity,clouds, weather
  }

}
