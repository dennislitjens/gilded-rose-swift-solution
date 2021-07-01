//
//  RuleFactoryTests.swift
//  
//
//  Created by Dennis Litjens on 01/07/2021.
//
@testable import GildedRose
import XCTest

class RuleFactoryTests: XCTestCase {
    
    private var ruleFactory: RuleFactory!
    
    override func setUp() {
        self.ruleFactory = GRRuleFactory()
    }
    
    func testAgedBrieReturnsAgedBrieRule() {
        let rule = ruleFactory.createRule(forItemType: .agedBrie, withSellIn: 0)
        XCTAssertTrue(type(of: rule) == AgedBrieRule.self)
    }
    
    func testNormalItemReturnsNormalItemRule() {
        let rule = ruleFactory.createRule(forItemType: .normalItem, withSellIn: 0)
        XCTAssertTrue(type(of: rule) == NormalItemRule.self)
    }
    
    func testBackstagePassReturnsBackstagePass() {
        let rule = ruleFactory.createRule(forItemType: .backstagePassItem, withSellIn: 0)
        XCTAssertTrue(type(of: rule) == BackstagePassRule.self)
    }
    
    func testSulfurasLegendaryItemReturnsSulfurasLegendaryRule() {
        let rule = ruleFactory.createRule(forItemType: .legendaryItem, withSellIn: 0)
        XCTAssertTrue(type(of: rule) == SulfurasLegendaryRule.self)
    }
    
    func testConjuredItemReturnsConjuredItemRule() {
        let rule = ruleFactory.createRule(forItemType: .conjuredItem, withSellIn: 0)
        XCTAssertTrue(type(of: rule) == ConjuredItemRule.self)
    }
}
