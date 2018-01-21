//
//  WCTextFileContentParser.swift
//  TestApp
//
//  Created by Nishant Sharma on 1/20/18.
//  Copyright © 2018 Nishant. All rights reserved.
//

import Foundation

class WCTextFileContentParser: NSObject {
    
    //Reading text file in chunk of 4096 and reading No of entries to be parsed as per mentioned condition below
    class func parseLimitedLinesFromTextFile(textFileName:String)->[String]{
        var itemArr:[String] = []
        let numberOfLinesToReadFromTextFile = 10000 //No of entries to be parsed
        if let filePath = Bundle.main.path(forResource: textFileName, ofType: "txt"){
            if let pathURL = URL.init(string: filePath){
                if FileManager.default.fileExists(atPath: pathURL.path) { print(1) }
                let s = StreamReader(url: pathURL)
                for _ in 2...numberOfLinesToReadFromTextFile {
                    if let line = s?.nextLine() {
                        itemArr.append(line)
                    }
                }
            }
        }
        return itemArr
    }
    //Parsing of text file
    class func loadAndParseCSVData()->[City]{
        var allRowArr:[City] = []
        var gcRawData = WCTextFileContentParser.parseLimitedLinesFromTextFile(textFileName: "cities")
        //Convert string line read into model class to bind with table view
        var singleRowArr:[String] = []
        if gcRawData.count > 0 {
            gcRawData.remove(at: 0)
        }
        for rowStr in gcRawData{
            singleRowArr = rowStr.components(separatedBy: ",")
            if singleRowArr.count >= 7{
                //Country,City,AccentCity,Region,Population,Latitude,Longitude
                let cityObj = City.init(country: singleRowArr[0], city: singleRowArr[1], accentCity: singleRowArr[2], region: singleRowArr[3], latitude: singleRowArr[5], longitude: singleRowArr[6], population: singleRowArr[4])
                allRowArr.append(cityObj)
            }
        }
        return allRowArr
    }
}

