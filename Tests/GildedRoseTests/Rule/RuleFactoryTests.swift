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
        let agedBrie = Item(name: "Aged Brie", sellIn: 0, quality: 0)
        let rule = ruleFactory.createRule(forItem: agedBrie)
        XCTAssertTrue(type(of: rule) == AgedBrieRule.self)
    }
    
    func testNormalItemReturnsNormalItemRule() {
        let normalItem = Item(name: "+5 Dexterity Vest", sellIn: 0, quality: 0)
        let rule = ruleFactory.createRule(forItem: normalItem)
        XCTAssertTrue(type(of: rule) == NormalItemRule.self)
    }
    
    func testBackstagePassReturnsBackstagePass() {
        let backstagePass = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 0)
        let rule = ruleFactory.createRule(forItem: backstagePass)
        XCTAssertTrue(type(of: rule) == BackstagePassRule.self)
    }
    
    func testSulfurasLegendaryItemReturnsSulfurasLegendaryRule() {
        let legendaryItem = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 0)
        let rule = ruleFactory.createRule(forItem: legendaryItem)
        XCTAssertTrue(type(of: rule) == SulfurasLegendaryRule.self)
    }
    
    func testConjuredItemReturnsConjuredItemRule() {
        let conjuredItem = Item(name: "Conjured Mana Cake", sellIn: 0, quality: 0)
        let rule = ruleFactory.createRule(forItem: conjuredItem)
        XCTAssertTrue(type(of: rule) == ConjuredItemRule.self)
    }
}
