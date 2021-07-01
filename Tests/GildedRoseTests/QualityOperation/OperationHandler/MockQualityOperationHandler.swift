//
//  MockQualityOperationHandler.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//

@testable import GildedRose

class MockQualityOperationHandler: QualityOperationHandler {
    
    var calledMethods: [String] = []
    var MIN_QUALITY: Int = 0
    var MAX_QUALITY: Int = 50
    
    func calculateQuality(withQualityOperation qualityOperation: QualityOperation, forQuality quality: Int) -> Int {
        calledMethods.append("calculateQuality")
        return 0
    }
    
    func degrade(_ quality: Int, withDegradeValue degradeValue: Int) -> Int {
        return 0
    }
    
    func increase(_ quality: Int, withIncreaseValue increaseValue: Int) -> Int {
        return 0
    }
}
