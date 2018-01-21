//
//  City.swift
//  TestApp
//
//  Created by Nishant Sharma on 1/20/18.
//  Copyright © 2018 Nishant. All rights reserved.
//

import Foundation
class City: NSObject {
    //Country,City,AccentCity,Region,Population,Latitude,Longitude
    var country: String
    var city: String
    var accentCity: String
    var region: String
    var latitude: String
    var longitude: String
    var population: String
    
    init(country: String, city: String,accentCity: String, region: String,latitude: String, longitude: String, population: String) {
        self.country = country
        self.city = city
        self.accentCity = accentCity
        self.region = region
        self.latitude = latitude
        self.longitude = longitude
        self.population = population.isEmpty ? "0" : population
    }
}

