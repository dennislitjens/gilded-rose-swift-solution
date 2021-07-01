//
//  AgedBrieRuleTests.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//
@testable import GildedRose
import XCTest

class AgedBrieRuleTests: XCTestCase {
    
    func testOperationIsIncreaseBy1() {
        let operation = AgedBrieRule().qualityOperation
        guard case QualityOperation.increases(with: 1) = operation else {
            XCTFail("Expected increases(with: 1) but got \(operation)")
            return
        }
    }
}
