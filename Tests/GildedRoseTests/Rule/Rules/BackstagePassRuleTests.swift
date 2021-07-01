//
//  BackstagePassRuleTests.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//

@testable import GildedRose
import XCTest

class BackstagePassRuleTests: XCTestCase {
    
    func testOperationIsDropToZeroWhenSellinPassed() {
        let operation = BackstagePassRule(sellIn: -1).qualityOperation
        guard case QualityOperation.dropToZero = operation else {
            XCTFail("Expected dropToZero but got \(operation)")
            return
        }
    }
    
    func testOperationIsIncreasesBy3WhenSellin5DaysOrLess() {
        let operation = BackstagePassRule(sellIn: 5).qualityOperation
        guard case QualityOperation.increases(with: 3) = operation else {
            XCTFail("Expected increases(with: 3) but got \(operation)")
            return
        }
    }
    
    func testOperationIsIncreasesBy2WhenSellin10DaysOrLess() {
        let operation = BackstagePassRule(sellIn: 10).qualityOperation
        guard case QualityOperation.increases(with: 2) = operation else {
            XCTFail("Expected increases(with: 2) but got \(operation)")
            return
        }
    }
    
    func testOperationIsIncreasesBy1WhenSellinMoreThen10Days() {
        let operation = BackstagePassRule(sellIn: 11).qualityOperation
        guard case QualityOperation.increases(with: 1) = operation else {
            XCTFail("Expected increases(with: 1) but got \(operation)")
            return
        }
    }
}

