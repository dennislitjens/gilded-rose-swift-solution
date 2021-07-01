//
//  ConjuredItemRuleTests.swift
//  
//
//  Created by Dennis Litjens on 01/07/2021.
//
@testable import GildedRose
import XCTest

class ConjuredItemRuleTests: XCTestCase {
    
    func testOperationIsDegradedWith4WhenSellinIsZeroOrLess() {
        let operation = ConjuredItemRule(sellIn: 0).qualityOperation
        guard case QualityOperation.degrades(with: 4) = operation else {
            XCTFail("Expected degrades(with: 4) but got \(operation)")
            return
        }
        
        let operation2 = ConjuredItemRule(sellIn: -1).qualityOperation
        guard case QualityOperation.degrades(with: 4) = operation2 else {
            XCTFail("Expected degrades(with: 4) but got \(operation2)")
            return
        }
    }
    
    func testOperationIsDegradedWith2WhenSellinIsMoreThenZero() {
        let operation = ConjuredItemRule(sellIn: 1).qualityOperation
        guard case QualityOperation.degrades(with: 2) = operation else {
            XCTFail("Expected degrades(with: 2) but got \(operation)")
            return
        }
    }
}


