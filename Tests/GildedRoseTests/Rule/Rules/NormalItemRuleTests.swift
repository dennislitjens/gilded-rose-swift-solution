//
//  NormalItemRuleTests.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//

@testable import GildedRose
import XCTest

class NormalItemRuleTests: XCTestCase {
    
    func testOperationIsDegradesWith2WhenSellinIsZeroOrLess() {
        let operation = NormalItemRule(sellIn: 0).qualityOperation
        guard case QualityOperation.degrades(with: 2) = operation else {
            XCTFail("Expected degrades(with: 2) but got \(operation)")
            return
        }
        
        let operation2 = NormalItemRule(sellIn: -1).qualityOperation
        guard case QualityOperation.degrades(with: 2) = operation2 else {
            XCTFail("Expected degrades(with: 2) but got \(operation2)")
            return
        }
    }
    
    func testOperationIsDegradesWith1WhenSellinIsMoreThenZero() {
        let operation = NormalItemRule(sellIn: 1).qualityOperation
        guard case QualityOperation.degrades(with: 1) = operation else {
            XCTFail("Expected degrades(with: 1) but got \(operation)")
            return
        }
    }
}

