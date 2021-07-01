//
//  RuleFactory.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//

public protocol RuleFactory {
    func createRule(forItem item: Item) -> Rule
}

public class GRRuleFactory: RuleFactory {
    
    public init() {}
    
    public func createRule(forItem item: Item) -> Rule {
        switch item.isTypeOff() {
        case .agedBrie:
            return AgedBrieRule()
        case .normalItem:
            return NormalItemRule(sellIn: item.sellIn)
        case .backstagePassTAFKAL80ETC:
            return BackstagePassRule(sellIn: item.sellIn)
        case .sulfurasHandOfRagnaros:
            return SulfurasLegendaryRule()
        case .conjuredItem:
            return ConjuredItemRule(sellIn: item.sellIn)
        }
    }
}
