//
//  GildedRoseUnitTests.swift
//  
//
//  Created by Dennis Litjens on 01/07/2021.
//
@testable import GildedRose
import XCTest

class GildedRoseUnitTests: XCTestCase {
    
    private var app: GildedRose!
    private var itemTypeFactoryMock: MockItemTypeFactory!
    private var ruleFactoryMock: MockRuleFactory!
    private var qualityOperationHandlerMock: MockQualityOperationHandler!
    private var sellinRuleMock: MockSellinRule!
    
    override func setUp() {
        self.itemTypeFactoryMock = MockItemTypeFactory()
        self.ruleFactoryMock = MockRuleFactory()
        self.qualityOperationHandlerMock = MockQualityOperationHandler()
        self.sellinRuleMock = MockSellinRule()
        self.app = GildedRose(
            items: [
                Item(name: "foo", sellIn: 0, quality: 0),
                Item(name: "foo2", sellIn: 0, quality: 0)
            ],
            itemTypeFactory: itemTypeFactoryMock,
            ruleFactory: ruleFactoryMock,
            qualityOperationHandler: qualityOperationHandlerMock,
            sellInRule: sellinRuleMock
        )
    }
    
    func testUpdateQualityCallsCreateRuleForEveryItem() {
        app.updateQuality()
        XCTAssertEqual(2, ruleFactoryMock.calledMethods.map { $0 == "createRule" }.count)
    }
    
    func testUpdateQualityCallsCalculateQualityForEveryItem() {
        app.updateQuality()
        XCTAssertEqual(2, qualityOperationHandlerMock.calledMethods.map { $0 == "calculateQuality" }.count)
    }
    
    func testUpdateQualityCalculateSellinForEveryItem() {
        app.updateQuality()
        XCTAssertEqual(2, sellinRuleMock.calledMethods.map { $0 == "calculateSellIn" }.count)
    }
    
    func testUpdateQualityCallsItemTypeForItem() {
        app.updateQuality()
        XCTAssertEqual(2, itemTypeFactoryMock.calledMethods.map { $0 == "itemType(forItem)" }.count)
    }
}

