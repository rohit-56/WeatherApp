//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Rohit Sharma on 04/10/22.
//

import UIKit

class WeatherViewController: UIViewController {
     
    @IBOutlet weak var CityName: UILabel!
    @IBOutlet weak var Temp: UILabel!
    
    @IBOutlet weak var Description: UILabel!
    
    @IBOutlet weak var min: UILabel!
    
    @IBOutlet weak var max: UILabel!
    
    var tempe : String?
    var weather  : WeatherResponse?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     
       // CityName.text = "Delhi"
      //  Temp.text = tempe
       
    }
    
    @IBOutlet weak var search: UISearchBar!
    func getData() {
            
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=delhi&appid=c6ddd223cc502984b33546fe5f13361b&units=metric") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let dataTask =  URLSession.shared.dataTask(with: request) { [self] data, response, error in
            guard data != nil else {
                print("data is nil")
                return
            }
            let decoder = JSONDecoder()
            
            do{
                let result = try decoder.decode(WeatherResponse.self,from: data!)
                weather = result
                tempe = String(format: "%f", result.main.temp)
                print(result.weather.description)
                print("hello")
            }catch{
                print("Error while parsing JSON data")
            }
            
           
        
        }
        dataTask.resume()
        }

}
