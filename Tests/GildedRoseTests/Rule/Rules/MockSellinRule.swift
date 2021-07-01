//
//  MockSellinRule.swift
//  
//
//  Created by Dennis Litjens on 01/07/2021.
//

@testable import GildedRose

public class MockSellinRule: SellinRule {
        
    public var calledMethods: [String] = []
    public init() {}
    
    public func calculateSellIn(forItemType itemType: ItemType, withSellin sellIn: Int) -> Int {
        self.calledMethods.append("calculateSellIn")
        return 0
    }
}
