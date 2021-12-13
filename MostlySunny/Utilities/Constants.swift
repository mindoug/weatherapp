//
//  Constants.swift
//  MostlySunny
//
//  Created by Mindy Douglas on 12/12/21.
//

import Foundation

struct Constants {
  
  static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
  
  static let archiveURL = documentsDirectory.appendingPathComponent("weatherInfo")
    .appendingPathExtension("plist")
  
}
