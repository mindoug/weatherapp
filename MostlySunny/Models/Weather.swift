//
//  Weather.swift
//  MostlySunny
//
//  Created by Mindy Douglas on 12/7/21.
//

import Foundation

struct Weather: Codable {
  
  var id: Int
  var main: String
  var description: String
  
  var weatherImage: String {
    switch id {
      case 200...232:
        return "cloud.bolt"
      case 300...321:
        return "cloud.drizzle"
      case 500...520:
        return "cloud.rain"
      case 521...531:
        return "cloud.heavyrain"
      case 600...602:
        return "cloud.snow"
      case 611...621:
        return "cloud.sleet"
      case 622:
        return "cloud.snow"
      case 701...731:
        return "sun.haze"
      case 732...762:
        return "sun.dust"
      case 771:
        return "hurricane"
      case 761:
        return "tornado"
      case 800:
        return "sun.max"
      case 801...804:
        return "cloud"
      default:
        return "cloud.sun"
    }
  }
}
