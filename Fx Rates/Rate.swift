//
//  Rate.swift
//  Fx Rates
//
//  Created by Lois-Anne Hall on 12/05/2021.
//

import Foundation


struct BaseInfo:Decodable {
    var base:String
}

struct RatesInfo: Decodable {
    var rates:String
}
