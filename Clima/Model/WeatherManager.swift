
import UIKit
import CoreLocation


protocol WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}


struct WeatherManager {
    
    //let urlBase: String = "https://api.openweathermap.org/data/2.5/weather?appid=094b533fef5373bd4c6dda27dc2797e3&units=metric"
    var urlBase: String
    
    func getLink() -> String {
        
        let file = "key.txt"
        var text: String = ""

        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            let fileURL = dir.appendingPathComponent(file)

            do {
                text = try String(contentsOf: fileURL, encoding: .utf8)
            }
            catch {
                
            }
        }
        
        return text
    }
    
    init() {
        self.urlBase = getLink()
    }
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        
        let urlString: String = "\(urlBase)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) {
        
        let urlString: String = "\(urlBase)&lat=\(latitude)&lon=\(longtitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        
        // Create URL
        if let url = URL(string: urlString) {
            // Create URL session
            let session = URLSession(configuration: .default)
            
            // Give the session a task
            // Closure
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            // Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let city = decodedData.name
            let temperature = decodedData.main.temp
            let conditionID = decodedData.weather[0].id
            
            let weather = WeatherModel(city: city, conditionID: conditionID, temperature: temperature)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
