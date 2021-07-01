//
//  SellinRule.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//

public protocol SellinRule {
    func calculateSellIn(forItemType itemType: ItemType, withSellin sellIn: Int) -> Int
}

public struct GRSellinRule: SellinRule {
    
    public init() {}
    
    public func calculateSellIn(forItemType itemType: ItemType, withSellin sellIn: Int) -> Int {
        if sellIn >= 0 && itemType != .legendaryItem {
            return sellIn - 1
        }
        return sellIn
    }
}
