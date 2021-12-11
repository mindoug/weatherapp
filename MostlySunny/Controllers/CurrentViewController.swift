//
//  CurrentViewController.swift
//  MostlySunny
//
//  Created by Mindy Douglas on 12/7/21.
//

import UIKit

class CurrentViewController: UIViewController {
  
  var quote = Quote()
  let weatherInfoController = WeatherInfoController()
  
  var latitude = "33.543682"
  var longitude = "-86.779633"
  var result: String = ""
  
  @IBOutlet weak var latitudeTextField: UITextField!
  @IBOutlet weak var longitudeTextField: UITextField!
  @IBOutlet weak var currentTempLabel: UILabel!
  @IBOutlet weak var currentImageView: UIImageView!
  @IBOutlet weak var currentConditionLabel: UILabel!
  @IBOutlet weak var feelsLikeLabel: UILabel!
  @IBOutlet weak var cloudImage: UIImageView!
  @IBOutlet weak var cloudsLabel: UILabel!
  @IBOutlet weak var windImage: UIImageView!
  @IBOutlet weak var windLabel: UILabel!
  @IBOutlet weak var humidityImage: UIImageView!
  @IBOutlet weak var humidityLabel: UILabel!
  @IBOutlet weak var quoteLabel: UILabel!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    quoteLabel.text = quote.randomQuote
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
  }
  
  func updateUI() {
    weatherInfoController.fetchWeatherInfo(lat: latitude, lon: longitude, completion: {(result) in
      DispatchQueue.main.async {
        switch result {
          case .success(let weatherInfo):
            
            let temp = String(format: "%.0f", weatherInfo.current.temp)
            self.currentTempLabel.text = temp + "°"
              
              let imageName = weatherInfo.current.weather[0].weatherImage
            self.currentImageView.image = UIImage(systemName: imageName)
              
            self.currentConditionLabel.text = weatherInfo.current.weather[0].main
              
              let feels = String(format: "%.0f",weatherInfo.current.feelsLike)
            self.feelsLikeLabel.text = "Feels like \(feels)°"
              
            self.cloudsLabel.text = String(weatherInfo.current.clouds) + "%"
              
            let wind = String(format: "%.0f", weatherInfo.current.windSpeed)
            self.windLabel.text = String(wind) + " mph"
              
            self.humidityLabel.text = String(weatherInfo.current.humidity) + "%"

          case .failure(let error):
            print(error)
        }
      }
    })
  }
  
  func saveWeather() {
    
  }
  
  func loadWeather() {
    // load data from the disk and assign it to the weather property
  }
  
  func displayError(_ error: Error) {
    print("Fetch WeatherInfo failed with error: \(error)")
  }
    
  @IBAction func submitButton(_ sender: Any) {
    latitude = latitudeTextField.text ?? "33.543682"
    longitude = longitudeTextField.text ?? "-86.779633"
    updateUI()
  }
  
  
  
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  
  
  
  
  

}
