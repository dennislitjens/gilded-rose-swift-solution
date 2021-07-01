//
//  ItemsTypeFactoryTests.swift
//  
//
//  Created by Dennis Litjens on 28/06/2021.
//

@testable import GildedRose
import XCTest

class ItemsTypeFactoryTests: XCTestCase {
    
    var itemTypeFactory: ItemTypeFactory!
    
    override func setUp() {
        itemTypeFactory = GRItemTypeFactory()
    }
    
    func testAgedBrieNameReturnsCorrectType() {
        let item = Item(name: "Aged Brie", sellIn: 0, quality: 0)
        XCTAssertEqual(ItemType.agedBrie, itemTypeFactory.itemType(forItem: item))
    }
    
    func testSulfurasHandOfRagnarosNameReturnsCorrectType() {
        let item = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 0)
        XCTAssertEqual(ItemType.legendaryItem, itemTypeFactory.itemType(forItem: item))
    }
    
    func testBackstagePassNameReturnsCorrectType() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 0)
        XCTAssertEqual(ItemType.backstagePassItem, itemTypeFactory.itemType(forItem: item))
    }
    
    func testConjuredItemReturnsCorrectType() {
        let item = Item(name: "Conjured Mana Cake", sellIn: 0, quality: 0)
        XCTAssertEqual(ItemType.conjuredItem, itemTypeFactory.itemType(forItem: item))
    }
    
    func testNotImplementedNameReturnsNormalItem() {
        let item = Item(name: "+5 Dexterity Vest", sellIn: 0, quality: 0)
        XCTAssertEqual(ItemType.normalItem, itemTypeFactory.itemType(forItem: item))
    }
}
