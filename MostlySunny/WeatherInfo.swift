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
  var temperature: Int
  var high: Int
  var low: Int
  var condition: String
  var feelsLike: String
  var image: Image
  var humidity: String
  var precipitation: Double
  var windSpeed: Int
  var windDirection: Double
  var alert: String
}


// let image = UIImage(systemName: "")
// let imageView = UIImageView(image: image)
