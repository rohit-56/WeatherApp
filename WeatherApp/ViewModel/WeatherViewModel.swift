//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Rohit Sharma on 16/11/22.
//

import Foundation

class WeatherViewModel{
    
    
    func getData(_ city : String , completion : @escaping (WeatherResponse? , Error?) ->Void) {
              
          guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=c6ddd223cc502984b33546fe5f13361b&units=metric") else {
              return
          }
          
          var request = URLRequest(url: url)
          request.httpMethod = "GET"
          let dataTask =  URLSession.shared.dataTask(with: request) { data, response, error in
              guard data != nil else {
                  print("data is nil")
                  return
              }
            
              
              do{
                  let result = try JSONDecoder().decode(WeatherResponse.self,from: data!)
                  completion(result,nil)
              }catch{
                  print("Error while parsing JSON data")
                  completion(nil , error)
              }
              
             
          
          }
          dataTask.resume()
          }
}
