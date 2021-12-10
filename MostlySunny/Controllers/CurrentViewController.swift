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
      
    weatherInfoController.fetchWeatherInfo(lat: latitude, lon: longitude, completion: {(result) in
      DispatchQueue.main.async {
        switch result {
          case .success(let weatherInfo):
            self.updateUI(with: weatherInfo)
            print("Successfully fetched weatherInfo. Current temperature in Hoover, AL is \(weatherInfo.current.temp).")
          case .failure(let error):
            self.displayError(error)
        }
      }
    })
  }
  func updateUI(with weatherInfo: WeatherInfo) {

    let temp = String(format: "%.0f", weatherInfo.current.temp)
    currentTempLabel.text = temp + "°"
    
    let imageName = weatherInfo.current.weather[0].weatherImage
    currentImageView.image = UIImage(systemName: imageName)
    
    currentConditionLabel.text = weatherInfo.current.weather[0].main
    
    let feels = String(weatherInfo.current.feelsLike)
    feelsLikeLabel.text = "Feels like \(feels)°"
    
    cloudsLabel.text = String(weatherInfo.current.clouds) + "%"
    
    windLabel.text = String(weatherInfo.current.windSpeed) + "mph"
    
    humidityLabel.text = String(weatherInfo.current.humidity) + "%"

  }
  
  func displayError(_ error: Error) {
    print("Fetch WeatherInfo failed with error: \(error)")
  }
    
  @IBAction func submitButton(_ sender: Any) {
    
    latitude = latitudeTextField.text ?? "33.543682"
    longitude = longitudeTextField.text ?? "-86.779633"
   
    
    print("The latitude is: \(String(describing: latitudeTextField.text))" )
    print("The longitude is: \(String(describing: longitudeTextField.text))" )
      
  }
  
  
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
