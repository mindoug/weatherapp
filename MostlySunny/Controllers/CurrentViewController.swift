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
  var dateTime = DateTimeFormat()
  
  var weatherInfo: WeatherInfo? = nil
  
  var location = Location(latitude: "", longitude: "")
  
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
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var segmentedTableView: UITableView!
  @IBOutlet weak var backgroundImageView: UIImageView!
  
  let dailyCellID = "DailyCell"
  let hourlyCellID = "HourlyCell"
  
  enum WeatherState: Int {
    case hourly, daily
  }
  
  var weatherState: WeatherState = .hourly
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    quoteLabel.text = quote.randomQuote
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
    location = loadWeatherInfo() ?? Location(latitude: "33.543682", longitude: "-86.779633")
    
    updateUI()
    
    let dailyNib = UINib(nibName: "DailyTableViewCell", bundle: Bundle.main)
    let hourlyNib = UINib(nibName: "HourlyTableViewCell", bundle: Bundle.main)
    
    segmentedTableView.register(dailyNib, forCellReuseIdentifier: dailyCellID)
    segmentedTableView.register(hourlyNib, forCellReuseIdentifier: hourlyCellID)
    
  }
  
  func updateUI() {
    weatherInfoController.fetchWeatherInfo(lat: location.latitude, lon: location.longitude, completion: {(result) in
      DispatchQueue.main.async {
        switch result {
          case .success(let weatherInfo):
            self.weatherInfo = weatherInfo
            
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
            
            if (weatherInfo.alerts?.count ?? 0) > 0 {
              self.quoteLabel.text = "Alert: From \(weatherInfo.alerts![0].sender): \(weatherInfo.alerts![0].event): \(weatherInfo.alerts![0].description)"
              self.quoteLabel.textColor = .red
            } else {
              self.quoteLabel.text = self.quote.randomQuote
              self.quoteLabel.textColor = .black
            }
            
            self.segmentedTableView.reloadData()

          case .failure(let error):
            self.displayError(error)
        }
      }
    })
  }
  
  func displayError(_ error: Error) {
    print("Fetch WeatherInfo failed with error: \(error)")
  }
  
  @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
    weatherState = WeatherState(rawValue: sender.selectedSegmentIndex) ?? .hourly
    updateWeatherSelection()
  }
  
  func updateWeatherSelection() {
    switch weatherState {
      case .hourly, .daily:
        segmentedTableView.isHidden = false
        segmentedTableView.reloadData()
    }
  }
    
  @IBAction func submitButton(_ sender: Any) {
   
    location.latitude = latitudeTextField.text ?? "33.543682"
    location.longitude = longitudeTextField.text ?? "-86.779633"
    updateUI()
    saveWeatherInfo(location)
  }
  
  func saveWeatherInfo(_ location: Location) {
    let propertyListEncoder = PropertyListEncoder()
    let codedInfo = try? propertyListEncoder.encode(location)
    try? codedInfo?.write(to: Constants.archiveURL, options: .noFileProtection)
  }
  
  func loadWeatherInfo() -> Location? {
    guard let codedInfo = try? Data(contentsOf: Constants.archiveURL) else { return nil }
    let propertyListDecoder = PropertyListDecoder()
    return try? propertyListDecoder.decode(Location.self, from: codedInfo)
  }
}

extension CurrentViewController: UITableViewDataSource {
 
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
    if let weatherInfo = weatherInfo {
      
    switch weatherState {
      case .hourly:
        segmentedTableView.backgroundColor = UIColor.clear
        return weatherInfo.hourly.count
      case .daily:
        segmentedTableView.backgroundColor = UIColor.clear
        return weatherInfo.daily.count
      }
    }
    return 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if weatherState == .hourly {
      if let cell = tableView.dequeueReusableCell(withIdentifier: hourlyCellID, for: indexPath) as?
          HourlyTableViewCell {
        
        cell.hourlyTimeLabel.text = String(dateTime.getTime(timestamp: weatherInfo!.hourly[indexPath.row].dt))
        
        cell.hourlyTempLabel.text = String(format: "%.0f",(weatherInfo!.hourly[indexPath.row].temp)) + "°"
        cell.hourlyImageLabel.image = UIImage(systemName: weatherInfo!.hourly[indexPath.row].weather[0].weatherImage)
        cell.hourlyPopLabel.text = String(format: "%.0f",(weatherInfo!.hourly[indexPath.row].pop)) + "%"
        cell.backgroundColor = UIColor.clear
        return cell
      }
    } else if weatherState == .daily {
      if let cell = tableView.dequeueReusableCell(withIdentifier: dailyCellID, for: indexPath) as?
          DailyTableViewCell {
        
        cell.dayLabel.text = String(dateTime.getDate(timestamp:  weatherInfo!.daily[indexPath.row].dt))
        
        cell.dailyHighLabel.text = "High " + String(format: "%0.f",(weatherInfo!.daily[indexPath.row].temp.max)) + "°"
        cell.dailyLowLabel.text = "Low " + String(format: "%.0f",(weatherInfo!.daily[indexPath.row].temp.min)) + "°"
        cell.dailyImage.image = UIImage(systemName: weatherInfo!.daily[indexPath.row].weather[0].weatherImage)
        cell.dailyPopLabel.text = String(format: "%.0f",(weatherInfo!.daily[indexPath.row].pop)) + "%"
        cell.backgroundColor = UIColor.clear
        return cell
      }
    }
    return UITableViewCell()
  }
}

