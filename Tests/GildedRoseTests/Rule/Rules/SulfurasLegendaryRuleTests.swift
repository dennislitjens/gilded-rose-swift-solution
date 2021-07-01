//
//  File.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//
@testable import GildedRose
import XCTest

class SulfurasLegendaryRuleTests: XCTestCase {
    
    func testOperationIsIncreaseBy1() {
        let operation = SulfurasLegendaryRule().qualityOperation
        guard case QualityOperation.doesNotChange = operation else {
            XCTFail("Expected doesNotChange but got \(operation)")
            return
        }
    }
}
