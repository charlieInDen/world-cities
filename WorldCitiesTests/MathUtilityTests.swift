//
//  MathUtilityTests.swift
//  WorldCitiesTests
//
//  Created by Nishant Sharma on 1/21/18.
//  Copyright © 2018 Nishant. All rights reserved.
//

import XCTest
@testable import WorldCities

class MathUtilityTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_SumOfTwoNumber(){
        let positiveNumber = 100
        let negativeNumber = -50
        let defaultNumber = 0
        
        //Addition of positive integers and zero
        XCTAssertEqual(MathUtility.sum(a: positiveNumber, b: defaultNumber), positiveNumber + defaultNumber)
        
        //Addition of positive integers and negative integers
        XCTAssertEqual(MathUtility.sum(a: positiveNumber, b: negativeNumber), positiveNumber + negativeNumber)
        
        //Addition of negative integers
        XCTAssertEqual(MathUtility.sum(a: negativeNumber, b: negativeNumber), negativeNumber + negativeNumber)
        
        //Addition of negative integer and zero
        XCTAssertEqual(MathUtility.sum(a: negativeNumber, b: defaultNumber), negativeNumber + defaultNumber)
        
        //Addition of very large integers - Fail case
        XCTAssertNotEqual(MathUtility.sum(a: Int.max, b: Int.max), Int.max)
        
        //Addition of very minimum integers - Fail case
        XCTAssertNotEqual(MathUtility.sum(a: Int.min, b: Int.min), Int.min)
        
    }
}
