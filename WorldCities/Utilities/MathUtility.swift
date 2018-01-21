//
//  MathUtility.swift
//  WorldCities
//
//  Created by Nishant Sharma on 1/21/18.
//  Copyright © 2018 Nishant. All rights reserved.
//

import Foundation

class MathUtility: NSObject {
    class func sum(a:Int,b:Int) ->Int {
        if (a > 0) && (b > (Int.max - a)) {
            /* handle overflow */
            return Int.max
        } else if (a < 0) && (b < (Int.min - a)) {
            /* handle underflow */
            return Int.min
        }
        return a + b
    }
}
