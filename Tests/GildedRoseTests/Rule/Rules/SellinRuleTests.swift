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
        let item = Item(name: "+5 Dexterity Vest", sellIn: -1, quality: 1)
        let sellIn = sellinRule.calculateSellIn(forItem: item)
        XCTAssertEqual(-1, sellIn)
    }
    
    func testCalculateReturnsSameSellinWhenTypeIsLegendary() {
        let item = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 2, quality: 1)
        let sellIn = sellinRule.calculateSellIn(forItem: item)
        XCTAssertEqual(2, sellIn)
    }
    
    func testCalculateReturnsSellinDegradedWith1WhenSellinIsNotPassed() {
        let item = Item(name: "+5 Dexterity Vest", sellIn: 2, quality: 1)
        let sellIn = sellinRule.calculateSellIn(forItem: item)
        XCTAssertEqual(1, sellIn)
    }
}
