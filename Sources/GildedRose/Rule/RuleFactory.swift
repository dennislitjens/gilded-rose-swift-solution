//
//  RuleFactory.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//

public protocol RuleFactory {
    func createRule(forItemType itemType: ItemType, withSellIn: Int) -> Rule
}

public class GRRuleFactory: RuleFactory {
    
    public init() {}
    
    public func createRule(forItemType itemType: ItemType, withSellIn sellIn: Int) -> Rule {
        switch itemType {
        case .agedBrie:
            return AgedBrieRule()
        case .normalItem:
            return NormalItemRule(sellIn: sellIn)
        case .backstagePassItem:
            return BackstagePassRule(sellIn: sellIn)
        case .legendaryItem:
            return SulfurasLegendaryRule()
        case .conjuredItem:
            return ConjuredItemRule(sellIn: sellIn)
        }
    }
}
