//
//  DateTimeFormat.swift
//  MostlySunny
//
//  Created by Mindy Douglas on 12/12/21.
//

import Foundation

struct DateTimeFormat {
  
  var date = ""
  var time = ""
  
  mutating func getDate(timestamp: Double) -> String {
    
    let dt = Date(timeIntervalSince1970: timestamp)
    let dateFormatter = DateFormatter()
    let timeZone = TimeZone.current.abbreviation() ?? "CET"
    
      dateFormatter.timeZone = TimeZone(abbreviation: timeZone)
      dateFormatter.locale = NSLocale.current
      dateFormatter.dateFormat = "E"
    date = dateFormatter.string(from: dt)
    
    return date
  }
  
  mutating func getTime(timestamp: Double) -> String {
    
    let dt = Date(timeIntervalSince1970: timestamp)
    let dateFormatter = DateFormatter()
    let timeZone = TimeZone.current.abbreviation() ?? "CET"
    
      dateFormatter.timeZone = TimeZone(abbreviation: timeZone)
      dateFormatter.locale = NSLocale.current
      dateFormatter.dateFormat = "h:mm"
    time = dateFormatter.string(from: dt)
    
    return time
    
  }
}
