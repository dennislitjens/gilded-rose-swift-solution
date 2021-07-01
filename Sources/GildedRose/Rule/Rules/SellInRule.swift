//
//  SellinRule.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//

public protocol SellinRule {
    func calculateSellIn(forItem item: Item) -> Int
}

public struct GRSellinRule: SellinRule {
    
    public init() {}
    
    public func calculateSellIn(forItem item: Item) -> Int {
        if item.sellIn >= 0 && item.isTypeOff() != .sulfurasHandOfRagnaros {
            return item.sellIn - 1
        }
        return item.sellIn
    }
}
