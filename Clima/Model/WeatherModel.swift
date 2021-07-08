
import Foundation

// comment structure
struct WeatherModel {
    
    let city: String
    let conditionID: Int
    let temperature: Double
    
    // Computed property
    var conditionName: String {
        switch conditionID {
        
        case 200..<300:
            return "cloud.bolt"
        case 300..<400:
            return "cloud.drizzle"
        case 500..<600:
            return "cloud.rain"
        case 600..<700:
            return "cloud.snow"
        case 700..<800:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 800..<900:
            return "cloud"
            
        default:
            return "cloud"
        }
    }
    
    var temperatureString: String {
        return String(format: "%d", Int(temperature))
    }
    
}
