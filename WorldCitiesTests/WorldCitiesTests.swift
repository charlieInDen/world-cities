//
//  WorldCitiesTests.swift
//  WorldCitiesTests
//
//  Created by Nishant Sharma on 1/21/18.
//  Copyright © 2018 Nishant. All rights reserved.
//

import XCTest
@testable import WorldCities

class WorldCitiesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testParseLimitedLinesFromTextFile(){
        let resultArray = WCTextFileContentParser.parseLimitedLinesFromTextFile(textFileName: "cities")
        XCTAssert(resultArray.count > 0, "Parsing text file failed!!")
        
        let returnedArray = WCTextFileContentParser.parseLimitedLinesFromTextFile(textFileName: "unknown")
        XCTAssert(returnedArray.count == 0, "Texting file not found for parsing so no elements found!!")
        
    }
    func test_searchText(){
        let wcViewModel:WCViewModel = WCViewModel()
        let searchText = "Aixas"
        //Searching text in original array filled from txt file
        wcViewModel.filterContentForSearchText(searchText, completionBlock: {
        })
        XCTAssert(wcViewModel.citiesArrToDisplay.count > 0, "search item not found")
        
        //Check When original Data array is empty and try to search using written function
        wcViewModel.originalCitiesArrayToDisplay = []
        wcViewModel.filterContentForSearchText(searchText, completionBlock: {
        })
        XCTAssert(wcViewModel.citiesArrToDisplay.count == 0, "search item not found")
    }
    
    func test_SortFunction(){
        let wcViewModel:WCViewModel = WCViewModel()
        let previousFirstElement = wcViewModel.citiesArrToDisplay[0]
        wcViewModel.sortContentByOrder("Ascending") {
        }
        XCTAssert(wcViewModel.citiesArrToDisplay[0] != previousFirstElement, "Sorting failed")
        
    }
    func testPerformanceForParseFunction() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            _ = WCTextFileContentParser.parseLimitedLinesFromTextFile(textFileName: "cities")
        }
    }
    func testPerformanceForSearchTextFunction() {
        // This is an example of a performance test case.
        self.measure {
            let wcViewModel:WCViewModel = WCViewModel()
            let searchText = "Ai"
            //Searching text in original array filled from txt file
            wcViewModel.filterContentForSearchText(searchText, completionBlock: {
            })
        }
    }
    
}
