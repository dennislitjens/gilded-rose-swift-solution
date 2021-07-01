//
//  SellInRuleTests.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//

@testable import GildedRose
import XCTest

class SellInRuleTests: XCTestCase {
    
    var sellinRule: SellinRule!
    
    override func setUp() {
        sellinRule = GRSellinRule()
    }
    
    func testCalculateReturnsSameSellinWhenSellinIsPassed() {
        let sellIn = sellinRule.calculateSellIn(forItemType: .normalItem, withSellin: -1)
        XCTAssertEqual(-1, sellIn)
    }
    
    func testCalculateReturnsSameSellinWhenTypeIsLegendary() {
        let sellIn = sellinRule.calculateSellIn(forItemType: .legendaryItem, withSellin: 2)
        XCTAssertEqual(2, sellIn)
    }
    
    func testCalculateReturnsSellinDegradedWith1WhenSellinIsNotPassed() {
        let sellIn = sellinRule.calculateSellIn(forItemType: .normalItem, withSellin: 2)
        XCTAssertEqual(1, sellIn)
    }
}
