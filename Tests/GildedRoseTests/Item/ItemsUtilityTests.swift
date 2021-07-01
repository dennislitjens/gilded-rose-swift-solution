//
//  ItemsUtilityTests.swift
//  
//
//  Created by Dennis Litjens on 28/06/2021.
//

@testable import GildedRose
import XCTest

class ItemsUtilityTests: XCTestCase {
    
    func testAgedBrieNameReturnsCorrectType() {
        let item = Item(name: "Aged Brie", sellIn: 0, quality: 0)
        XCTAssertEqual(ItemType.agedBrie, item.isTypeOff())
    }
    
    func testSulfurasHandOfRagnarosNameReturnsCorrectType() {
        let item = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 0)
        XCTAssertEqual(ItemType.sulfurasHandOfRagnaros, item.isTypeOff())
    }
    
    func testBackstagePassNameReturnsCorrectType() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 0)
        XCTAssertEqual(ItemType.backstagePassTAFKAL80ETC, item.isTypeOff())
    }
    
    func testConjuredItemReturnsCorrectType() {
        let item = Item(name: "Conjured Mana Cake", sellIn: 0, quality: 0)
        XCTAssertEqual(ItemType.conjuredItem, item.isTypeOff())
    }
    
    func testNotImplementedNameReturnsNormalItem() {
        let item = Item(name: "+5 Dexterity Vest", sellIn: 0, quality: 0)
        XCTAssertEqual(ItemType.normalItem, item.isTypeOff())
    }
}
