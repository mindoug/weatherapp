//
//  WeatherInfoController.swift
//  MostlySunny
//
//  Created by Mindy Douglas on 12/7/21.
//

import Foundation

class WeatherInfoController {
  
  func fetchWeatherInfo(lat: String, lon: String, completion: @escaping (Result<WeatherInfo, Error>) -> Void) {
    
    var urlComponents = URLComponents(string: "https://api.openweathermap.org/data/2.5/onecall")!
     urlComponents.queryItems = [
      "lat": lat,
      "lon": lon,
      "exclude": "minutely",
      "appid": Secrets.API_key
    ].map { URLQueryItem(name: $0.key, value: $0.value) }
    
    let task = URLSession.shared.dataTask(with: urlComponents.url!) {
      (data, response, error) in
      let jsonDecoder = JSONDecoder()
      if let data = data {
         do {
         let weatherInfo = try jsonDecoder.decode(WeatherInfo.self, from: data)
           completion(.success(weatherInfo))
         } catch {
           completion(.failure(error))
         }
      }
    }
     task.resume()
   }
}
