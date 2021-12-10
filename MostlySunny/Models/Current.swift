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
  var dt: Int
  var feelsLike: Double
  var humidity: Int
  var visibility: Int
  var dewPoint: Double
  var clouds: Int
  var windSpeed: Double
  var windDegrees: Int
  var uvi: Double
  var weather: [Weather]
  
  enum CodingKeys: String, CodingKey {
    case feelsLike = "feels_like"
    case dewPoint = "dew_point"
    case windSpeed = "wind_speed"
    case windDegrees = "wind_deg"
    case sunrise, sunset, temp, humidity, clouds, weather, visibility, uvi, dt
  }

}
