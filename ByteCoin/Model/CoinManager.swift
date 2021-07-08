
import Foundation


protocol CoinManagerDelegate {
    
    func didUpdatePrice(price: String, currency: String)
    func didFailWithError(error: Error)
}


struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "4FA9E74D-85D9-4255-A606-A6B6A102DB46"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD", "UAH", "USD","ZAR"]

    
    func getCoinPrice(for currency: String) {
        
        // Creating url string
        let urlString = baseURL + "/" + currency + "?apikey=" + apiKey
        
        // Converting url string to URL
        if let url = URL(string: urlString) {
            
            // Creating session
            let session = URLSession(configuration: .default)
            
            // Creating task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                // Parsing
                if let safeData = data {
                    if let bitcoinPrice = self.parseJSON(safeData) {
                        let priceString = String(format: "%.2f", bitcoinPrice)
                        
                        self.delegate?.didUpdatePrice(price: priceString, currency: currency)
                    }
                }
            }
            
            // Performing task
            task.resume()
        }
    }
        
    func parseJSON(_ data: Data) -> Double? {
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            print(lastPrice)
            
            return lastPrice
            
        } catch {
            print(error)
            return nil
        }
    }
}
