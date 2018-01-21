//
//  WCViewModel.swift
//  TestApp
//
//  Created by Nishant Sharma on 1/20/18.
//  Copyright © 2018 Nishant. All rights reserved.
//

import Foundation
class WCViewModel: NSObject {
    var citiesArrToDisplay:[City] = []
    var originalCitiesArrayToDisplay:[City] = []
    
    //Initialize the array for displaying on city table view
    override init() {
        self.originalCitiesArrayToDisplay = WCTextFileContentParser.loadAndParseCSVData()
        self.citiesArrToDisplay = self.originalCitiesArrayToDisplay
    }
    //Filter array based on search text and provide completion block so that UI can be update on completion.
    func filterContentForSearchText(_ searchText: String, scope: String = "", completionBlock:@escaping ()->Void){
        self.citiesArrToDisplay = self.originalCitiesArrayToDisplay.filter({( cities : City) -> Bool in
            return  cities.city.lowercased().contains(searchText.lowercased())
        })
        completionBlock()
    }
    //Sorting array based on order and provide completion block so that UI can be update on completion.
    func sortContentByOrder(_ order: String, completionBlock:@escaping ()->Void){
        self.originalCitiesArrayToDisplay = self.originalCitiesArrayToDisplay.sorted(by: { (city1, city2) -> Bool in
            if order == "Descending"{//We can use enums of it
                return Int(city1.population) ?? 0 >= Int(city2.population) ?? 0
            }else{
                return Int(city1.population) ?? 0 <= Int(city2.population) ?? 0
            }
        })
        self.citiesArrToDisplay = self.originalCitiesArrayToDisplay
        completionBlock()
    }
    //Cancel search - reloading with original sorted or unsorted array based on condition
    func updateOriginalArrayOfCities(){
        self.citiesArrToDisplay = self.originalCitiesArrayToDisplay
    }
}

