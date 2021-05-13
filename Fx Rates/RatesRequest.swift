//
//  RatesRequest.swift
//  Fx Rates
//
//  Created by Lois-Anne Hall on 12/05/2021.
//

import Foundation

enum RatesError: Error{
    case noDataAvailable
    case canNotProcessData
}

struct RateRequest {
    let resourceURL:URL
    let API_KEY = "6b5dcc0f37d6a83868efae52d24c0135"
    
    init(ratesCode:String) {
        let resourceString = "http://data.fixer.io/api/latest?access_key=\(API_KEY)&base=\(ratesCode)"
        guard let resourceURL = URL(string: resourceString) else {return}
        self.resourceURL = resourceURL
    }
    
    func getRates(completion: @escaping(Result<[RatesInfo], RatesError>) -> Void){
        let dataTask = URLSession.shared.dataTask(with: resourceURL){data, _, _ in
            guard let jsonData = data else{
                completion(.failure(.noDataAvailable))
                return
            }
            do{
                let decoder = JSONDecoder()
                let ratesResponse = try decoder.decode(RatesInfo.self, from: jsonData)
                let ratesDetails = RatesInfo.rates
                completion(.success(ratesDetails))
            }catch{
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
    
    
}
