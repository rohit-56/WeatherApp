//
//  APICaller.swift
//  WeatherApp
//
//  Created by Rohit Sharma on 03/01/23.
//

import Foundation


class APICaller {
    
    static let shared = APICaller()
    
    func fetchWeatherDetails(with city : String , completion : @escaping (Result<WeatherResponse , Error>) -> Void ){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=c6ddd223cc502984b33546fe5f13361b&units=metric") else {return}
        
        let task  = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data , _ , error) in
            
            guard let data = data , error == nil else {return}
            
            do{
                let results = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(.success(results))
            }catch{
                completion(.failure(error))
            }
            
        }
        task.resume()
        
        
    }
    
}

